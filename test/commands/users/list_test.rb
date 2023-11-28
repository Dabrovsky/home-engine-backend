# frozen_string_literal: true

require "test_helper"

module Users
  class ListTest < ActiveSupport::TestCase
    test "List class inherits from Command class" do
      assert_equal Command, List.superclass
    end

    test "returns an array as response" do
      create(:user)
      input = {}
      output = List.new(**input).call

      assert_equal 1, output.value.count
    end

    test "returns an empty array when no records found" do
      input = {}
      output = List.new(**input).call

      assert_empty output.value
    end
  end
end
