# frozen_string_literal: true

module ShippingServices
  class Fedex
    attr_reader :fedex, :result

    def initialize
      @fedex = ::Fedex::Shipment.new(credentials)
      @result = {}
    end

    def track(tracking_number)
      result[:delivery_status] = fedex.track(tracking_number: tracking_number)
    rescue ::Fedex::RateError, Net::ReadTimeout => e
      result[:error] = e
      retry if e.is_a? Net::ReadTimeout
      result
    end

    private

    def credentials
      Rails.configuration.shipping_services[:fedex][:credentials]
    end
  end
end
