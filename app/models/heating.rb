# frozen_string_literal: true

class Heating
  include ActiveData::Model

  attribute :id, String, default: "fake"
  attribute :outdoor_temperature, String
  attribute :heating_temperature, String
  attribute :hotwater_temperature, String
  attribute :heating_switch, String
  attribute :hotwater_switch, String
  attribute :flame, String
end
