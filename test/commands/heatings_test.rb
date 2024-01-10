# frozen_string_literal: true

require "test_helper"

class HeatingsTest < ActiveSupport::TestCase
  include TcpServerHelper

  test "CommandHandler is included" do
    assert_includes Heatings, CommandHandler
  end

  test ".fetch_data returns heating data as Response value" do
    input = {}
    output = Heatings.fetch_data(input:)

    assert_instance_of Response, output
  end
end
