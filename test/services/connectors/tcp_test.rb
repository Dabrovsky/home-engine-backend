# frozen_string_literal: true

require "test_helper"

module Connectors
  class TCPTest < ActiveSupport::TestCase
    attr_reader :tcp_server, :tcp_connector

    setup do
      @tcp_server = TCPServer.new(0)
      port, host = tcp_server.addr[1..2]
      @tcp_connector = Connectors::TCP.new(host, port, 1)
    end

    teardown do
      tcp_server.close
      tcp_connector.disconnect
    end

    test ".connect returns instance of TCPSocket" do
      output = tcp_connector.connect

      assert_instance_of TCPSocket, output
    end

    test ".publish_message is abble to send message" do
      tcp_connector.connect
      tcp_connector.publish_message("test message")
      server = tcp_server.accept
      output = server.gets&.chomp

      assert_equal "test message", output
    end

    test ".consume_message is able to receive message" do
      tcp_connector.connect
      server = tcp_server.accept
      server.puts("test message")
      output = tcp_connector.consume_message

      assert_equal "test message", output.value
    end

    test "raises Errno::ECONNREFUSED when couldn't connect" do
      tcp_server.close
      exception = assert_raise(Errno::ECONNREFUSED) { tcp_connector.connect }

      assert_equal "Connection refused", exception.message
    end

    test "raises Timeout::Error when no message received" do
      tcp_connector.connect
      exception = assert_raise(Timeout::Error) { tcp_connector.consume_message }

      assert_equal "Timeout: No message received", exception.message
    end
  end
end
