# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Api::V1::ErrorsHandler
  include Authenticatable
end
