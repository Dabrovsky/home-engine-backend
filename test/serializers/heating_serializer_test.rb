# frozen_string_literal: true

require "test_helper"

class HeatingSerializerTest < ActiveSupport::TestCase
  test "serializes heating representation with correct attributes" do
    heating = build(:heating)

    expected_hash = {
      data: {
        id: heating.id,
        type: :heating,
        attributes: {
          outdoor_temperature: "10°C",
          heating_temperature: "10°C",
          hotwater_temperature: "10°C",
          heating_switch: "off",
          hotwater_switch: "off",
          flame: "off"
        }
      }
    }

    serialized_data = HeatingSerializer.new(heating).serializable_hash

    assert_equal expected_hash[:data], serialized_data[:data]
  end
end
