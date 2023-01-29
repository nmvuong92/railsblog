# mocks and stubs
require "rails_helper"

module Stub2
  class NumberGenerator
    def random
      "A" * rand(1..10)
    end
  end
end

RSpec.describe "Random" do
  it "generates a random number" do
    generator = Stub2::NumberGenerator.new
    allow(generator).to receive(:rand).and_return(5) # stub
    expect(generator.random).to eq("AAAAA")
  end
end
