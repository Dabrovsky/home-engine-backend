# frozen_string_literal: true

module Heatings
  class Fetch < Command
    def call
      Response.success(heating_data)
    end

    private

    def ebusd
      @ebusd ||= Adapters::Ebusd.new
    end

    def heating_data
      Heating.new(
        outdoor_temperature: ebusd.read("OutdoorstempSensor", "temp"),
        heating_temperature: ebusd.read("FlowTemp", "temp"),
        hotwater_temperature: ebusd.read("HwcTemp", "temp"),
        heating_switch: ebusd.read("HeatingSwitch"),
        hotwater_switch: ebusd.read("HwcSwitch"),
        flame: ebusd.read("Flame")
      )
    end
  end
end
