# frozen_string_literal: true

module Adapters
  class Adapter
    def initialize
      tcp.connect
    end

    delegate :disconnect, to: :tcp

    private

    def adapter_name
      self.class::ADAPTER_NAME
    end

    def host
      ENV.fetch("#{adapter_name}_HOST", nil)
    end

    def port
      ENV.fetch("#{adapter_name}_PORT", nil)
    end

    def tcp
      @tcp ||= Connectors::TCP.new(host, port)
    end
  end
end
