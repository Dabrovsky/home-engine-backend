# frozen_string_literal: true

require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  test "response success returns value back" do
    value = "test"
    response = Response.success(value)

    assert_equal true, response.success?
    assert_equal value, response.value
  end

  test "response failure returns value back" do
    value = "test"
    response = Response.failure(value)

    assert_equal true, response.failure?
    assert_equal value, response.value
  end
end
