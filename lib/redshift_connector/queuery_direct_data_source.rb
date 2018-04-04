require 'redshift_connector/queuery_exporter'
require 'redshift_connector/exporter_builder'
require 'redshift_connector/exception'
require 'queuery_client/client'
require 'queuery_client/queuery_data_file_bundle'

module RedshiftConnector
  class QueueryDirectDataSource < QueueryDataSource
    def execute_query(stmt, params = [])
      super(stmt, params).direct
    end
  end
end
