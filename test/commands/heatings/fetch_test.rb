# frozen_string_literal: true

require "test_helper"

module Heatings
  class FetchTest < ActiveSupport::TestCase
    include TcpServerHelper

    test "Fetch class inherits from Command class" do
      assert_equal Command, Fetch.superclass
    end

    test "returns a Response instance with heating data as a Response value" do
      expected_keys = %w[
        id
        outdoor_temperature
        heating_temperature
        hotwater_temperature
        heating_switch
        hotwater_switch
        flame
      ]
      input = {}
      output = Fetch.new(**input).call

      assert_instance_of Response, output
      assert_equal expected_keys.sort, output.value.as_json.keys.sort
    end
  end
end
