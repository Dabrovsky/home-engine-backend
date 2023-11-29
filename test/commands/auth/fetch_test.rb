# frozen_string_literal: true

require "test_helper"

module Auth
  class FetchTest < ActiveSupport::TestCase
    attr_reader :user

    setup do
      @user = create(:user)
    end

    test "Fetch class inherits from Command class" do
      assert_equal Command, Fetch.superclass
    end

    test "returns a Response instance with User as a Response value" do
      input = { email: user.email, password: user.password }
      output = Fetch.new(**input).call

      assert_instance_of Response, output
      assert_instance_of User, output.value
    end

    test "raises Api::Errors::ValidationError when parameters are missing" do
      input = {}
      exception = assert_raise(Api::Errors::ValidationError) { Fetch.new(**input).call }

      assert_equal "Provided parameters are invalid", exception.message
    end

    test "raises Api::Errors::UnathorizedError when user instance not found" do
      input = { email: "wrong", password: "wrong" }
      exception = assert_raise(Api::Errors::UnathorizedError) { Fetch.new(**input).call }

      assert_equal Auth::Fetch::UNAUTHORIZED, exception.message
    end

    test "raises Api::Errors::UnathorizedError when provided password is incorrect" do
      input = { email: user.email, password: "wrong" }
      exception = assert_raise(Api::Errors::UnathorizedError) { Fetch.new(**input).call }

      assert_equal Auth::Fetch::UNAUTHORIZED, exception.message
    end
  end
end
