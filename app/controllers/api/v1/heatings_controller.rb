# frozen_string_literal: true

module Api
  module V1
    class HeatingsController < ApplicationController
      def show
        heating = Heatings.fetch_data(input: {}).value

        render json: HeatingSerializer.new(heating).serializable_hash
      end
    end
  end
end
