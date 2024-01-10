# frozen_string_literal: true

require "test_helper"

class HeatingTest < ActiveSupport::TestCase
  attr_reader :heating

  setup do
    @heating = build(:heating)
  end

  test "is valid" do
    assert heating.valid?
  end
end
