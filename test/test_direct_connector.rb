require_relative 'helper'
require 'test/unit'

module RedshiftConnector
  Exporter.default_data_source = QueueryDirectDataSource.new
end

class TestConnector < Test::Unit::TestCase
  def test_transport
    data_date = '2016-11-03'
    job = RedshiftConnector.transport_delta(
      schema: $TEST_SCHEMA,
      table: 'item_pvs',

      txn_id: data_date,
      condition: %Q(data_date = date '#{data_date}'),

      columns: %w[id data_date item_id pv uu],
      upsert_columns: %w[pv uu],
      filter: -> (id, data_date, item_id, pv, uu) {
        [id.to_i, data_date, item_id.to_i, pv.to_i, uu.to_i]
      }
    )
    job.execute
  end
end
