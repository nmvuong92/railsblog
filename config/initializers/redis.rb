Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://docker.for.mac.localhost:7372/1' }
end