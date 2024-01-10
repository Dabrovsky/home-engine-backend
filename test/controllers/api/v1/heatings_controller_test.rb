# frozen_string_literal: true

require "test_helper"

module Api
  module V1
    class HeatingsControllerTest < ActionDispatch::IntegrationTest
      include TcpServerHelper

      attr_reader :headers

      setup do
        user = create(:user)
        access_token = Api::TokenProvider.encode_token(user_id: user.id)
        @headers = { "Authorization" => "Bearer #{access_token}" }.freeze
      end

      class ShowTest < HeatingsControllerTest
        test "returns heating object" do
          expected_keys = %i[
            outdoor_temperature
            heating_temperature
            hotwater_temperature
            heating_switch
            hotwater_switch
            flame
          ]

          get(api_v1_heating_path, headers:)

          assert_response :success
          assert_equal expected_keys.sort, json_response[:data][:attributes].keys.sort
        end
      end
    end
  end
end
