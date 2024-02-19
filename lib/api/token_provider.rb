# frozen_string_literal: true

# The TokenProvider module is responsible for handling JWT token
# generation and decoding used for token-based authentication
module Api
  module TokenProvider
    extend self

    EXPIRED_AT = 1.minute

    def self.encode_token(payload = {}, exp = EXPIRED_AT.from_now)
      payload.merge!(exp: exp.to_i) if payload.present?
      JWT.encode(payload, secret_key)
    end

    def self.decode_token(token)
      JWT.decode(token, secret_key).first
    end

    private

    def secret_key
      Rails.application.secret_key_base
    end
  end
end
