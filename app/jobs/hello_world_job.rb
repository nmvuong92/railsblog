# inside app/jobs/hello_world_job.rb
class HelloWorldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Simulates a long, time-consuming task
    sleep 5
    # Will display current time, milliseconds included
    p "hello from HelloWorldJob #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end

end