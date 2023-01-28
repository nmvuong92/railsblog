# frozen_string_literal: true
module Service
  class DataProcessor
    Error = Class.new(StandardError)

    def process(data, validator)
      raise Error unless validator.valid?(data)

      # simple logic to show the idaea
      "#{data} processed"
    end
  end
end