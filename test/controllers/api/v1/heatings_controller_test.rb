# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class HeatingsControllerTest < ActionDispatch::IntegrationTest
      attr_reader :headers

      setup do
        user = create(:user)
        access_token = Api::TokenProvider.encode_token(user_id: user.id)
        @headers = { "Authorization" => "Bearer #{access_token}" }.freeze
      end

      class ShowTest < HeatingsControllerTest
        test "returns heating object" do
          expected_response = {
            data: {
              id: "fake",
              type: "heating"
            }
          }

          get(api_v1_heating_path, headers:)

          assert_response :success
          assert_equal expected_response, json_response
        end
      end
    end
  end
end
