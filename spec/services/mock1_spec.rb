require "rails_helper"
require "rspec/mocks"
module Mock1
  class Payment
    attr_accessor :total_cents

    def initialize(payment_gateway, logger)
      @payment_gateway = payment_gateway
      @logger = logger
    end

    def save
      response = @payment_gateway.charge(total_cents)
      @logger.record_payment(response[:payment_id])
    end
  end

  class PaymentGateway
    def charge(total_cents)
      puts "THIS HITS THE PRODUCTION API AND ALTERS PRODUCTION DATA. THAT'S BAD!"

      { payment_id: rand(1000) }
    end
  end

  class Logger
    def record_payment(payment_id)
      puts "Payment id: #{payment_id}"
    end
  end
end
# A mock is a stub with a built-in expectation to be satisfied during the test.
# Test Stubs help with inputs and Mock Objects help with outputs
RSpec.describe "Mock1" do
  it 'records the payment' do
    payment_gateway = double()
    allow(payment_gateway).to receive(:charge).and_return(payment_id: 1234)

    logger = double()
    expect(logger).to receive(:record_payment).with(1234)

    payment = Mock1::Payment.new(payment_gateway, logger)
    payment.total_cents = 1800
    payment.save
  end
end