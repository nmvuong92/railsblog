class CreateReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts 'generate report job is running...'
  end
end
