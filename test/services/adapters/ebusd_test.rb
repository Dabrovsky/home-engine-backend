# frozen_string_literal: true

require "test_helper"

module Adapters
  class EbusdTest < ActiveSupport::TestCase
    include TcpServerHelper

    attr_reader :adapter

    setup do
      @adapter = Ebusd.new
    end

    teardown do
      adapter.disconnect
    end

    test "Ebusd class inherits from Adapter class" do
      assert_equal Adapter, Ebusd.superclass
    end

    test ".read is abble to read message" do
      adapter.read("test message")
      server = tcp_server.accept
      output = server.gets&.chomp

      assert_equal "read -m 60 test message", output
    end

    test ".write is abble to write message" do
      adapter.write("test message")
      server = tcp_server.accept
      output = server.gets&.chomp

      assert_equal "write -c bai test message", output
    end
  end
end
