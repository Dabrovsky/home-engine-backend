# frozen_string_literal: true

require "test_helper"

class HeatingSerializerTest < ActiveSupport::TestCase
  test "serializes heating representation with correct attributes" do
    heating_instance = Struct.new(:id)
    heating = heating_instance.new(id: "fake")

    expected_hash = {
      data: {
        id: heating.id,
        type: :heating
      }
    }

    serialized_data = HeatingSerializer.new(heating).serializable_hash

    assert_equal expected_hash[:data], serialized_data[:data]
  end
end
