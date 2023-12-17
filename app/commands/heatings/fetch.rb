# frozen_string_literal: true

module Heatings
  class Fetch < Command
    def call
      Response.success(heating_data)
    end

    private

    def heating_instance
      # Struct is being used as a temporary solution since it is not yet determined
      # whether heating information will be stored or fetched directly every time
      @heating_instance ||= Struct.new(:id)
    end

    def heating_data
      heating_instance.new(id: "fake")
    end
  end
end
