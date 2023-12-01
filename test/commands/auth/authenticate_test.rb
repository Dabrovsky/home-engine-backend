# frozen_string_literal: true

require "test_helper"

module Auth
  class AuthenticateTest < ActiveSupport::TestCase
    attr_reader :user

    setup do
      @user = create(:user)
    end

    test "Fetch class inherits from Command class" do
      assert_equal Command, Authenticate.superclass
    end

    test "returns a Response instance with User as a Response value" do
      token = Api::TokenProvider.encode_token(user_id: user.id)
      input = { token: }
      output = Authenticate.new(**input).call

      assert_instance_of Response, output
      assert_instance_of User, output.value
    end

    test "raises Api::Errors::ValidationError when token is missing" do
      input = {}
      exception = assert_raise(Api::Errors::ValidationError) { Authenticate.new(**input).call }

      assert_equal Auth::Authenticate::INVALID_PARAMETERS, exception.message
    end

    test "raises JWT::DecodeError when incorrect token provided" do
      input = { token: "wrong" }
      exception = assert_raise(JWT::DecodeError) { Authenticate.new(**input).call }

      assert_equal "Not enough or too many segments", exception.message
    end

    test "raises Api::Errors::UnathorizedError when user instance not found" do
      token = Api::TokenProvider.encode_token(user_id: "wrong")
      input = { token: }
      exception = assert_raise(Api::Errors::UnathorizedError) { Authenticate.new(**input).call }

      assert_equal Auth::Authenticate::UNAUTHORIZED, exception.message
    end
  end
end
