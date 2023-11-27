# frozen_string_literal: true

require "test_helper"

module Api
  module Errors
    ERROR_MESSAGE = "Custom error message"

    class ErrorTest < ActiveSupport::TestCase
      test ".to_json returns expected error format" do
        error = Api::Errors::Error.new(ERROR_MESSAGE)

        expected_response = {
          status: :internal_server_error,
          message: ERROR_MESSAGE
        }

        assert_equal expected_response.to_json, error.to_json
        assert_equal :internal_server_error, error.status
      end
    end

    class ArgumentErrorTest < ActiveSupport::TestCase
      test "returns bad_request status code" do
        error = Api::Errors::ArgumentError.new(ERROR_MESSAGE)

        expected_response = {
          status: :bad_request,
          message: ERROR_MESSAGE
        }

        assert_equal expected_response.to_json, error.to_json
        assert_equal :bad_request, error.status
      end
    end

    class NotFoundErrorTest < ActiveSupport::TestCase
      test "returns not_found status code" do
        error = Api::Errors::NotFoundError.new(ERROR_MESSAGE)

        expected_response = {
          status: :not_found,
          message: ERROR_MESSAGE
        }

        assert_equal expected_response.to_json, error.to_json
        assert_equal :not_found, error.status
      end
    end
  end
end
