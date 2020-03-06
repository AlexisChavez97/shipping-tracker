# frozen_string_literal: true

class TrackersController < ApplicationController
  def show
    result = TrackShipment.call(params: trackers_params)

    render json: { delivery_status: result.response[:json] }, status: result.response[:status]
  end

  private

  def trackers_params
    params.permit(:service, :tracking_number)
  end
end
