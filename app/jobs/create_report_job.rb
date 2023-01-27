# frozen_string_literal: true

class CreateReportJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Do something later
    Rails.logger.debug 'generate report job is runningzzz...'
    Rails.logger.debug _args
  end
end
