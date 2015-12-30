require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :title, String

  has n, :tags, through: Resource
end

# DataMapper.setup(:default, "postgres://localhost/b_manager_#{ENV['RACK_ENV']}")
# DataMapper.finalize
# DataMapper.auto_upgrade!
