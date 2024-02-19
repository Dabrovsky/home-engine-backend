# frozen_string_literal: true

FactoryBot.define do
  factory :heating do
    outdoor_temperature { "10" }
    heating_temperature { "10" }
    hotwater_temperature { "10" }
    heating_switch { "off" }
    hotwater_switch { "off" }
    flame { "off" }
  end
end
