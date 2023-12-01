# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      attr_reader :headers, :user

      setup do
        @user = create(:user)
        access_token = Api::TokenProvider.encode_token(user_id: user.id)
        @headers = { "Authorization" => "Bearer #{access_token}" }.freeze
      end

      class IndexTest < UsersControllerTest
        test "returns users collection" do
          expected_response = {
            data: [
              {
                id: user.id,
                type: "user",
                attributes: {
                  username: user.username,
                  email: user.email,
                  phone: user.phone
                }
              }
            ]
          }

          get(api_v1_users_path, headers:)

          assert_response :success
          assert_equal expected_response, json_response
        end
      end

      class ShowTest < UsersControllerTest
        test "returns user object" do
          expected_response = {
            data: {
              id: user.id,
              type: "user",
              attributes: {
                username: user.username,
                email: user.email,
                phone: user.phone
              }
            }
          }

          get(api_v1_user_path(user), headers:)

          assert_response :success
          assert_equal expected_response, json_response
        end
      end
    end
  end
end
