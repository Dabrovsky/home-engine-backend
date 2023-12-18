# frozen_string_literal: true

require "test_helper"

module Heatings
  class FetchTest < ActiveSupport::TestCase
    test "Fetch class inherits from Command class" do
      assert_equal Command, Fetch.superclass
    end

    test "returns a Response instance with heating data as a Response value" do
      heating_instance = Struct.new(:id)
      heating = heating_instance.new(id: "fake")
      input = {}
      output = Fetch.new(**input).call

      assert_instance_of Response, output
      assert_equal heating.as_json, output.value.as_json
    end
  end
end
