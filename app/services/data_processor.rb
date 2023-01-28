# frozen_string_literal: true
class DataProcessor
  Error = Class.new(StandardError)

  def process(data)
    raise Error unless Validator.new.valid?(data)

    "#{data} processed"
  end
end

class Validator
  def valid?(data)
    true
  end
end
