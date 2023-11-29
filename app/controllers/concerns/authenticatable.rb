# frozen_string_literal: true

module Authenticatable
  extend ActiveSupport::Concern

  AUTHORIZATION_TOKEN_MISSING = "Authentication token is missing"

  included do
    before_action :authenticate!

    private

    def authenticate!
      current_user
    end

    def current_user
      @current_user ||= Auth.authenticate_user(input: { token: }).value
    end

    def token
      request.headers["Authorization"].split.last
    rescue StandardError
      raise JWT::DecodeError, AUTHORIZATION_TOKEN_MISSING
    end
  end
end
