require 'redshift_connector/queuery_exporter'
require 'redshift_connector/exporter_builder'
require 'redshift_connector/exception'
require 'queuery_client/client'

module RedshiftConnector
  class QueueryDataSource
    def initialize(client = nil)
      @client = client || QueueryClient::Client.new
    end

    def exporter_builder
      ExporterBuilder.new(ds: self, exporter_class: QueueryExporter)
    end

    def execute_query(stmt, params = [], enable_cast: false)
      @client.query(stmt, params, enable_cast: enable_cast)
    rescue QueueryClient::QueryError => ex
      raise ExportError, ex.message
    end
  end
end
