require 'redshift_connector/queuery_data_source'
require 'redshift_connector/exception'

module RedshiftConnector
  class QueueryDirectDataSource < QueueryDataSource
    def execute_query(stmt, params = [])
      super(stmt, params).direct
    end
  end
end
