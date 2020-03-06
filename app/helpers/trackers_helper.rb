# frozen_string_literal: true

module TrackersHelper
  def get_generic_status(status, service)
    Rails.configuration.shipping_services[service.to_sym][:delivery_statuses].key(status)
  end
end