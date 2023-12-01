# frozen_string_literal: true

module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate!

      def login
        current_user = Auth.fetch_user(input: user_params).value
        access_token = Api::TokenProvider.encode_token(user_id: current_user.id)

        render json: { access_token: }
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
