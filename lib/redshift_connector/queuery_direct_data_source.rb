require 'redshift_connector/queuery_data_source'
require 'redshift_connector/exception'

module RedshiftConnector
  class QueueryDirectDataSource < QueueryDataSource
    def execute_query(stmt, params = [], enable_cast: false)
      super(stmt, params, enable_cast: enable_cast).direct
    end
  end
end
