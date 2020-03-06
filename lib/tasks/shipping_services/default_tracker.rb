# frozen_string_literal: true

require 'fedex'

module ShippingServices
  class DefaultTracker
    attr_reader :service, :service_class

    def initialize(service)
      @service = service

      find_service_class
    end

    def track_package(tracking_number)
      service_class.new.track(tracking_number)
    end

    private

    def find_service_class
      @service_class = "ShippingServices::#{service.capitalize}".constantize
    end
  end
end
