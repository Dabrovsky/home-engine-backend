# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class AuthControllerTest < ActionDispatch::IntegrationTest
      attr_reader :user

      setup do
        @user = create(:user)
      end

      class LoginTest < AuthControllerTest
        test "returns encoded token when valid credentials provided" do
          access_token = Api::TokenProvider.encode_token(user_id: user.id)
          expected_response = {
            access_token:
          }

          valid_params = {
            user: {
              email: user.email,
              password: user.password
            }
          }

          post(api_v1_login_path, params: valid_params)

          assert_response :success
          assert_equal expected_response, json_response
        end

        test "fails with empty params" do
          expected_response = {
            status: 400,
            message: "param is missing or the value is empty: user"
          }

          post(api_v1_login_path, params: {})

          assert_response :bad_request
          assert_equal expected_response, json_response
        end

        test "returns unauthorized when invalid credentials provided" do
          expected_response = {
            status: 401,
            message: "Provided credentials are incorrect"
          }

          invalid_params = {
            user: {
              email: "wrong",
              password: "wrong"
            }
          }

          post(api_v1_login_path, params: invalid_params)

          assert_response :unauthorized
          assert_equal expected_response, json_response
        end
      end
    end
  end
end
