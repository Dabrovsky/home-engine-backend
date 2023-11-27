# frozen_string_literal: true

require "test_helper"

class CommandTest < ActiveSupport::TestCase
  test "raise error when input not provided" do
    exception = assert_raises Api::Errors::ArgumentError do
      Command.new(nil).call
    end

    assert_equal Command::INPUT_NOT_DEFINED, exception.message
  end

  test ".call method is called when input provided" do
    input = {}

    assert_raises NotImplementedError do
      Command.new(**input).call
    end
  end
end
