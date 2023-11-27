# frozen_string_literal: true

module Api
  module Errors
    STATUSES = {
      "Error" => :internal_server_error,
      "ArgumentError" => :bad_request,
      "NotFoundError" => :not_found
    }.freeze

    class Error < StandardError
      attr_reader :status

      def initialize(message = nil, status: STATUSES[self.class.name.demodulize])
        super(message)
        @status = status
      end

      def to_json(**)
        { status:, message: }.to_json
      end
    end

    class ArgumentError < Error; end
    class NotFoundError < Error; end
  end
end
