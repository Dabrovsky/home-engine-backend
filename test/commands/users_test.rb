# frozen_string_literal: true

require "test_helper"

class UsersTest < ActiveSupport::TestCase
  test "CommandHandler is included" do
    assert_includes Users, CommandHandler
  end

  test ".fetch_users returns users collection" do
    user = create(:user)
    input = {}

    output = Users.fetch_users(input:)

    assert_instance_of Response, output
    assert_equal [user.id], output.value.ids
  end

  test ".fetch_user returns User as Response value" do
    user = create(:user)
    input = { user_id: user.id }

    output = Users.fetch_user(input:)

    assert_instance_of Response, output
    assert_equal user, output.value
  end
end
