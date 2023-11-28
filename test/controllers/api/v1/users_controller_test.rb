# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      class IndexTest < UsersControllerTest
        test "returns users collection" do
          user = create(:user)

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

          get api_v1_users_path

          assert_response :success
          assert_equal expected_response, json_response
        end
      end

      class ShowTest < UsersControllerTest
        test "returns user object" do
          user = create(:user)

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

          get api_v1_user_path(user)

          assert_response :success
          assert_equal expected_response, json_response
        end
      end
    end
  end
end
