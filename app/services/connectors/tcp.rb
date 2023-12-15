# frozen_string_literal: true

module Connectors
  class TCP
    TIMEOUT_MESSAGE = "Timeout: No message received"

    attr_reader :host, :port, :timeout_limit, :socket

    def initialize(host, port, timeout_limit = 3)
      @host = host
      @port = port
      @timeout_limit = timeout_limit
    end

    def connect
      @socket ||= TCPSocket.new(host, port)
    rescue Errno::ECONNREFUSED
      raise Errno::ECONNREFUSED
    end

    def publish_message(payload)
      validate_connection!
      socket.puts(payload)
    end

    def consume_message
      validate_connection!
      received_message = fetch_message
      Response.success(received_message)
    rescue Timeout::Error
      raise Timeout::Error, TIMEOUT_MESSAGE
    end

    def disconnect
      socket&.close
    end

    private

    def validate_connection!
      connect if socket&.closed?
    end

    def fetch_message
      Timeout.timeout(timeout_limit) do
        while (message = socket.gets&.chomp)
          return message if message.present?
        end
      end
    end
  end
end
