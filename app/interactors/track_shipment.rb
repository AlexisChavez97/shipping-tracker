# frozen_string_literal: true

class TrackShipment
  include Interactor
  include TrackersHelper

  VALID_SERVICES = %w[fedex ups].freeze

  attr_reader :result, :delivery_status, :tracker

  def call
    context.response = {}

    validate_params
    initialize_tracker
    track_package
  end

  private

  def validate_params
    if !VALID_SERVICES.include?(context.params[:service])
      context.response[:status] = :unprocessable_entity
      context.response[:json] = 'El servicio no es válido'
      context.fail!
    elsif context.params[:tracking_number].blank?
      context.response[:status] = :unprocessable_entity
      context.response[:json] = 'El numero de rastreo debe estar presente'
      context.fail!
    end
  end

  def initialize_tracker
    @tracker = ShippingServices::DefaultTracker.new(context.params[:service])
  end

  def track_package
    @result = tracker.track_package(context.params[:tracking_number])
    delivery_status = format_response(result)

    context.response[:status] = if result[:error].present?
      :unprocessable_entity
    else
      :success
    end
    context.response[:json] = delivery_status.to_s.upcase
  end

  def format_response(result)
    status = if result[:error].present?
     "exception"
    else
      tracking_info = result[:delivery_status].first
      tracking_info.status
    end
    get_generic_status(status, context.params[:service])
  end
end
