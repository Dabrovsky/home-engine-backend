# frozen_string_literal: true

module Heatings
  include CommandHandler

  module_function

  # Retrieve heating information
  #
  # @example
  #   Heatings.fetch_data(
  #     input: {}
  #   )
  def fetch_data(input: {})
    invoke_command(
      input:,
      command: Fetch
    )
  end
end
