require 'redshift_connector/logger'

module RedshiftConnector
  class QueueryExporter
    def initialize(ds:, query:, query_params: [], bundle_params: nil, enable_sort: false, enable_cast: false, logger: RedshiftConnector.logger)
      @ds = ds
      @query = query
      @query_params = query_params
      @bundle_params = bundle_params
      @bundle = nil
      @enable_sort = enable_sort
      @enable_cast = enable_cast
      @logger = logger
    end

    attr_reader :query
    attr_reader :bundle_params
    attr_reader :bundle
    attr_reader :logger

    def execute
      @logger.info "EXPORT #{@query.description} -> (Queuery S3 tmp)"
      stmt = @query.to_sql
      @logger.info "[SQL/Queuery] #{stmt.strip}"
      # FIXME: support enable_sort
      # FIXME: pass bundle_params?
      @bundle = @ds.execute_query(stmt, @query_params, enable_cast: @enable_cast)
      @bundle
    end
  end
end
