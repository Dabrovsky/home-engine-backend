# frozen_string_literal: true

class HeatingSerializer
  include JSONAPI::Serializer

  attribute :outdoor_temperature do |object|
    "#{object.outdoor_temperature.to_f.round}°C"
  end

  attributes :heating_temperature do |object|
    "#{object.heating_temperature.to_f.round}°C"
  end

  attributes :hotwater_temperature do |object|
    "#{object.hotwater_temperature.to_f.round}°C"
  end

  attributes :heating_switch, :hotwater_switch, :flame

  set_id :id
end
