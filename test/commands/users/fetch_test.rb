# frozen_string_literal: true

require "test_helper"

module Users
  class FetchTest < ActiveSupport::TestCase
    test "Fetch class inherits from Command class" do
      assert_equal Command, Fetch.superclass
    end

    test "returns a Response instance with User as a Response value" do
      user = create(:user)
      input = { user_id: user.id }
      output = Fetch.new(**input).call

      assert_instance_of Response, output
      assert_instance_of User, output.value
    end

    test "raises Api::Errors::ValidationError when user_id is missing" do
      input = { user_id: nil }
      exception = assert_raise(Api::Errors::ValidationError) { Fetch.new(**input).call }

      assert_equal "Provided parameters are invalid", exception.message
    end

    test "raises ActiveRecord::RecordNotFound when user instance not found" do
      input = { user_id: "wrong" }
      exception = assert_raise(ActiveRecord::RecordNotFound) { Fetch.new(**input).call }

      assert_equal Command::RECORD_NOT_FOUND, exception.message
    end
  end
end
