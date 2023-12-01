# frozen_string_literal: true

require "test_helper"

module Api
  class ErrorsTest < ActiveSupport::TestCase
    test "UnathorizedError class inherits from StandardError class" do
      assert_equal StandardError, Api::Errors::UnathorizedError.superclass
    end

    test "ValidationError class inherits from StandardError class" do
      assert_equal StandardError, Api::Errors::ValidationError.superclass
    end
  end
end
