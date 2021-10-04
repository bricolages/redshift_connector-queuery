GarageClient.configure do |config|
  config.name = "redshift-connector-queuery"
end

QueueryClient.configure do |config|
  config.endpoint = ENV['QUEUERY_ENDPOINT']
  config.token = ENV['QUEUERY_TOKEN']
  config.token_secret = ENV['QUEUERY_TOKEN_SECRET']
end

$TEST_SCHEMA = ENV['TEST_SCHEMA']
