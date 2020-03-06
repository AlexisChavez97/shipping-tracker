# frozen_string_literal: true

require 'fedex'

shipper = { 
  name: 'Bojack',
  company: 'Skydropx',
  phone_number: '555-555-5555',
  address: 'Main Street',
  city: 'Harrison',
  state: 'AR',
  postal_code: '72601',
  country_code: 'US' 
}

recipient = {
  name: 'Todd',
  company: 'Skydropx',
  phone_number: '555-555-5555',
  address: 'Main Street',
  city: 'Franklin Park',
  state: 'IL',
  postal_code: '60131',
  country_code: 'US',
  residential: 'false'
}

packages = []

# while packages.count < 1000
packages << {
  weight: { units: 'LB', value: 2 },
  dimensions: { length: 10, width: 5, height: 4, units: 'IN' }
}
  # packages << {
  #   weight: { units: 'LB', value: 6 },
  #   dimensions: { length: 5, width: 5, height: 4, units: 'IN' }
  # }
# end

shipping_options = {
  packaging_type: 'YOUR_PACKAGING',
  drop_off_type: 'REGULAR_PICKUP'
}

fedex = Fedex::Shipment.new(Rails.application.config_for(:shipping_services)[:fedex])

ship = fedex.ship(
  shipper: shipper,
  recipient: recipient,
  packages: packages,
  service_type: 'FEDEX_GROUND',
  shipping_options: shipping_options
)

binding.pry

puts ship[:completed_shipment_detail][:operational_detail][:transit_time]