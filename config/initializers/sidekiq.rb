# sidekiq_config = { url: ENV['JOB_WORKER_URL'] }
sidekiq_config = { url: 'redis://redis:6379/1' }
Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end
Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
