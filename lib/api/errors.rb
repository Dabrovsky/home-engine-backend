# frozen_string_literal: true

# The module defines custom error classes to handle API-related errors
module Api
  module Errors
    class UnathorizedError < StandardError; end
    class ValidationError < StandardError; end
  end
end
