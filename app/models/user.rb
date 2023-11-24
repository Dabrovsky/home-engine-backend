# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, :password, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, uniqueness: true, allow_blank: true
end
