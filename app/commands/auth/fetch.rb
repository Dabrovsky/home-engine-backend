# frozen_string_literal: true

module Auth
  class Fetch < Command
    include ActiveData::Model

    UNAUTHORIZED = "Provided credentials are incorrect"
    INVALID_PARAMETERS = "Provided parameters are invalid"

    attribute :email, String
    attribute :password, String

    validates :email, presence: true
    validates :password, presence: true

    def call
      validate_input!
      authenticate!
      Response.success(user)
    end

    private

    def validate_input!
      validate!
    rescue ActiveData::ValidationError
      raise Api::Errors::ValidationError, INVALID_PARAMETERS
    end

    def authenticate!
      return if user.authenticate(password)

      raise Api::Errors::UnathorizedError, UNAUTHORIZED
    end

    def user
      User.find_by!(email:)
    rescue ActiveRecord::RecordNotFound
      raise Api::Errors::UnathorizedError, UNAUTHORIZED
    end
  end
end
