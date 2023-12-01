# frozen_string_literal: true

require "test_helper"

class AuthTest < ActiveSupport::TestCase
  attr_reader :user

  setup do
    @user = create(:user)
  end

  test "CommandHandler is included" do
    assert_includes Auth, CommandHandler
  end

  test ".fetch_user returns User as Response value based on provided credentials" do
    input = { email: user.email, password: user.password }

    output = Auth.fetch_user(input:)

    assert_instance_of Response, output
    assert_equal user, output.value
  end

  test ".authenticate_user returns User as Response value based on provided token" do
    token = Api::TokenProvider.encode_token(user_id: user.id)
    input = { token: }

    output = Auth.authenticate_user(input:)

    assert_instance_of Response, output
    assert_equal user, output.value
  end
end
