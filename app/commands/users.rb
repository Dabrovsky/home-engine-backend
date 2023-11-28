# frozen_string_literal: true

module Users
  include CommandHandler

  module_function

  # Retrieve a list of users
  #
  # @example
  #   Users.fetch_users(
  #     input: {}
  #   )
  def fetch_users(input: {})
    invoke_command(
      input:,
      command: List
    )
  end

  # Retrieve user information
  #
  # @example
  #   Users.fetch_user(
  #     input: {
  #       user_id: String
  #     }
  #   )
  def fetch_user(input: {})
    invoke_command(
      input:,
      command: Fetch
    )
  end
end
