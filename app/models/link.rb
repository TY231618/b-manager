require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :title, String
end

DataMapper.setup(:default, "postgres://localhost/b_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!
