# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "active_data"
gem "bcrypt", "~> 3.1.13"
gem "bootsnap", require: false
gem "jsonapi-serializer"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.2"
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows]
  gem "factory_bot_rails", "~> 6.2", ">= 6.2.0"
end

group :development do
  gem "rubocop-rails", require: false
end
