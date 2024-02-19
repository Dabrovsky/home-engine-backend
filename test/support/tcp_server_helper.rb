# frozen_string_literal: true

module TcpServerHelper
  extend ActiveSupport::Concern

  EBUSD_HOST = "127.0.0.1"

  included do
    attr_reader :tcp_server

    setup do
      @tcp_server = TCPServer.new(EBUSD_HOST, 0)
      ENV["EBUSD_HOST"] = EBUSD_HOST
      ENV["EBUSD_PORT"] = tcp_server.addr[1].to_s
    end

    teardown do
      tcp_server.close
      ENV.delete("EBUSD_HOST")
      ENV.delete("EBUSD_PORT")
    end
  end
end
