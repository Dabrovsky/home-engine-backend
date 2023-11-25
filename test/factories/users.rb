# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { "fake_user" }
    email { "fake_user@example.com" }
    password { "fake_password" }
    phone { "123-456-7890" }
  end
end
