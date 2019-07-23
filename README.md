# redshift_connector adapter for Queuery

redshift_connector adapter for Queuery (Redshift HTTP API).
Queuery is Cookpad internal system, you may not need this library.

This library is formerly called as "redshift-connector-queuery".

## Setup

Add following line to your Gemfile.
```
gem 'redshift_connector'
gem 'redshift_connector-queuery'
```

Add `config/initializer/redshift_connector.rb` as following:
```
QueueryClient.configure do |config|
  config.endpoint = "https://queuery.example.com"
  config.token = "xxxxxxxxxx"
  config.token_secret = "yyyyyyyyyy"
end
RedshiftConnector::Exporter.default_data_source = RedshiftConnector::QueueryDataSource.new
```
