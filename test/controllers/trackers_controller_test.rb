# frozen_string_literal: true

require 'test_helper'
require 'fedex_stubs'

class TrackersControllerTest < ActionDispatch::IntegrationTest
  include ::FedexStubs

  def setup
    @params = {
      service: 'fedex',
      tracking_number: 12345678901234
    }
  end

  def test_show_responds_success
    stub_request_for_get_delivery_status

    get trackers_path, params: @params

    assert_response :success
  end

  def test_show_responds_unprocessable_entity_if_service_is_not_recognized
    @params[:service] = 'dhl'

    get trackers_path, params: @params

    assert_response :unprocessable_entity
  end

  def test_show_responds_unprocessable_entity_if_tracking_number_is_empty
    @params[:service] = 'dhl'

    get trackers_path, params: @params

    assert_response :unprocessable_entity
  end
end