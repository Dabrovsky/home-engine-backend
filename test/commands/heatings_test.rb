# frozen_string_literal: true

require "test_helper"

class HeatingsTest < ActiveSupport::TestCase
  test "CommandHandler is included" do
    assert_includes Heatings, CommandHandler
  end

  test ".fetch_data returns heating data as Response value" do
    heating_instance = Struct.new(:id)
    heating = heating_instance.new(id: "fake")
    input = {}

    output = Heatings.fetch_data(input:)

    assert_instance_of Response, output
    assert_equal heating.as_json, output.value.as_json
  end
end
