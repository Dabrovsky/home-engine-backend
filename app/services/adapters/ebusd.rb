# frozen_string_literal: true

module Adapters
  class Ebusd < Adapter
    ADAPTER_NAME = "EBUSD"

    def read(*payload)
      name, field = payload
      message = "read -m 60 #{name} #{field}"

      response = send_message(message.strip)
      response.value
    end

    def write(*payload)
      name, value = payload
      message = "write -c bai #{name} #{value}"

      response = send_message(message.strip)
      response.value
    end

    private

    def send_message(message)
      Concurrent::Promises.future do
        tcp.publish_message(message)
        tcp.consume_message.value
      end
    end
  end
end
