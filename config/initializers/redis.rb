Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDIS_URL") }
end

