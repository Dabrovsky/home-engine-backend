# frozen_string_literal: true

module Auth
  class Authenticate < Command
    include ActiveData::Model

    UNAUTHORIZED = "Authentication failed"
    INVALID_PARAMETERS = "Provided parameters are invalid"

    attribute :token, String
    validates :token, presence: true

    def call
      validate_input!
      Response.success(user)
    end

    private

    def validate_input!
      validate!
    rescue ActiveData::ValidationError
      raise Api::Errors::ValidationError, INVALID_PARAMETERS
    end

    def payload
      @payload ||= Api::TokenProvider.decode_token(token)
    end

    def user
      User.find(payload["user_id"])
    rescue ActiveRecord::RecordNotFound
      raise Api::Errors::UnathorizedError, UNAUTHORIZED
    end
  end
end
