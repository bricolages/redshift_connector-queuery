require 'active_record'
require 'activerecord-import'
require 'activerecord-import/base'
ActiveRecord::Import.require_adapter 'mysql2'
require 'redshift_connector'
require 'redshift_connector-queuery'
require 'garage_client'
require 'queuery_client'
require 'yaml'
require 'logger'

YAML.load_file("#{__dir__}/database.yml").each do |name, ent|
  ActiveRecord::Base.configurations[name] = ent
end

class BaseConn < ActiveRecord::Base
  establish_connection :mysql
  self.abstract_class = true
end
class ItemPv < BaseConn
  connection
end

require_relative 'config'

RedshiftConnector.logger = Logger.new($stderr)
