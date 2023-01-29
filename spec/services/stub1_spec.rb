require "rails_helper"
require "rspec/mocks"
module Stub1

  class Customer
    def initialize
      super
    end

    def buy(book, quantity)
      book.decrease_count_on_hand(quantity)
    end
  end

  class Book
    def initialize
      super
    end

    def decrease_count_on_hand(quantity)
      Stub1::XAPI::api_decrease_count_on_hand(quantity) # return true or false
    end

    def XAPI
      def self.api_decrease_count_on_hand
        return [true, false].sample #return a random value true or false
      end
    end
  end
end



# A method stub is an implementation that returns a pre-determined value.
RSpec.describe "Stub 1" do
  context '#buy' do
    let(:customer) { Stub1::Customer.new }
    let(:book) { Stub1::Book.new }

    it 'returns true' do
      allow(book).to receive(:decrease_count_on_hand).and_return(true)

      expect(customer.buy(book, 1)).to eq true
    end
  end
end
