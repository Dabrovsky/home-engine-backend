# frozen_string_literal: true

class Command
  INPUT_NOT_DEFINED = "Input not provided"
  INVALID_PARAMETERS = "Provided parameters are invalid"

  attr_reader :input

  def initialize(input = {})
    @input = input
    validate_input!
  end

  def call
    raise NotImplementedError
  end

  private

  def validate_input!
    raise Api::Errors::ArgumentError, INPUT_NOT_DEFINED if input.nil?
  end
end
