# frozen_string_literal: true

require "test_helper"

class UserSerializerTest < ActiveSupport::TestCase
  test "serializes user representation with correct attributes" do
    user = create(:user)

    expected_hash = {
      data: {
        id: user.id,
        type: :user,
        attributes: {
          username: user.username,
          email: user.email,
          phone: user.phone
        }
      }
    }

    serialized_data = UserSerializer.new(user).serializable_hash

    assert_equal expected_hash[:data], serialized_data[:data]
  end

  test "serializes empty users collection" do
    expected_hash = { data: [] }

    serialized_data = UserSerializer.new(
      User.all,
      is_collection: true
    ).serializable_hash

    assert_equal expected_hash[:data], serialized_data[:data]
  end
end
