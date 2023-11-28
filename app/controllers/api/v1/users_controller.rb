# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = Users.fetch_users(input: {}).value

        render json: UserSerializer.new(
          users,
          is_collection: true
        ).serializable_hash
      end

      def show
        user = Users.fetch_user(input: { user_id: }).value

        render json: UserSerializer.new(user).serializable_hash
      end

      private

      def user_id
        params.require(:id)
      end
    end
  end
end
