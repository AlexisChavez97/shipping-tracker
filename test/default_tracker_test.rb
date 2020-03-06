# frozen_string_literal: true

require "test_helper"

class DefaultTrackerTest < ActiveSupport::TestCase
  def setup
    @service = 'fedex'
  end

  def test_it_finds_correct_service_class
    tracker = ShippingServices::DefaultTracker.new(@service)

    assert_equal tracker.service_class, ShippingServices::Fedex
  end
end
