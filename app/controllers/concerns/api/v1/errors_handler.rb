# frozen_string_literal: true

module Api
  module V1
    module ErrorsHandler
      extend ActiveSupport::Concern

      included do
        rescue_from StandardError, with: :internal_server_error
        rescue_from ActionController::ParameterMissing, with: :bad_request
        rescue_from Api::Errors::UnathorizedError, with: :unauthorized
        rescue_from Api::Errors::ValidationError, with: :validation_failed
        rescue_from JWT::ExpiredSignature, with: :signature_expired
        rescue_from JWT::DecodeError, with: :invalid_token
      end

      private

      def internal_server_error(_exception)
        render json: {
          status: 500, message: "Something went wrong"
        }, status: :internal_server_error
      end

      def bad_request(exception)
        render json: {
          status: 400, message: exception.message
        }, status: :bad_request
      end

      def unauthorized(exception)
        render json: {
          status: 401, message: exception.message
        }, status: :unauthorized
      end

      def validation_failed(exception)
        render json: {
          status: 422, message: exception.message
        }, status: :unprocessable_entity
      end

      def signature_expired(exception)
        render json: {
          status: 401, message: exception.message
        }, status: :unauthorized
      end

      def invalid_token(exception)
        render json: {
          status: 401, message: exception.message
        }, status: :unauthorized
      end
    end
  end
end
