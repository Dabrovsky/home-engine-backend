# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  attr_reader :user

  setup do
    @user = build(:user)
  end

  test "is valid" do
    assert user.valid?
  end

  test "is invalid without username" do
    user.username = nil

    assert user.invalid?
  end

  test "is invalid without email" do
    user.email = nil

    assert user.invalid?
  end

  test "is invalid without password" do
    user.password = nil

    assert user.invalid?
  end

  test "email should be unique" do
    duplicate_user = user.dup
    user.save

    assert duplicate_user.invalid?
  end

  test "phone can be blank" do
    user.phone = nil

    assert user.valid?
  end

  test "phone should be unique" do
    duplicate_user = user.dup
    user.save

    assert duplicate_user.invalid?
  end
end
