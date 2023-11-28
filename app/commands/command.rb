# frozen_string_literal: true

class Command
  RECORD_NOT_FOUND = "Record not found"

  attr_reader :input

  def initialize(**input)
    @input = input
  end

  def call
    raise NotImplementedError
  end
end
