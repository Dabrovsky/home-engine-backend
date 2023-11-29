# frozen_string_literal: true

module Auth
  include CommandHandler

  module_function

  # Retrieve user information
  #
  # @example
  #   Auth.fetch_user(
  #     input: {
  #       email: String,
  #       password: String
  #     }
  #   )
  def fetch_user(input: {})
    invoke_command(
      input:,
      command: Fetch
    )
  end

  # Authenticate and retrieve user information
  #
  # @example
  #   Auth.authenticate_user(
  #     input: {
  #       token: String
  #     }
  #   )
  def authenticate_user(input: {})
    invoke_command(
      input:,
      command: Authenticate
    )
  end
end
