# redshift-connector-queuery

Queuery Redshift HTTP API adapter for redshift-connector.

## Setup

Add `config/initializer/redshift-connector.rb` as following:
```
QueueryClient.configure do |config|
  config.endpoint = "https://queuery.example.com"
  config.token = "xxxxxxxxxx"
  config.token_secret = "yyyyyyyyyy"
end
RedshiftConnector::Exporter.default_data_source = RedshiftConnector::QueueryDataSource.new
```
