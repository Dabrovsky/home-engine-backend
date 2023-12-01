# frozen_string_literal: true

require "test_helper"

module Api
  class TokenProviderTest < ActiveSupport::TestCase
    attr_reader :payload

    setup do
      user = create(:user)
      @payload = { user_id: user.id }
    end

    test ".encode_token returns encoded token" do
      token = TokenProvider.encode_token(payload)

      assert_instance_of String, token
    end

    test ".decode_token returns decoded payload" do
      token = TokenProvider.encode_token(payload)
      decoded_payload = TokenProvider.decode_token(token)

      assert_equal payload[:user_id], decoded_payload["user_id"]
    end
  end
end
