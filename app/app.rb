require 'sinatra/base'
require_relative 'models/link'
require 'tilt/erb'

class BManager < Sinatra::Base

get '/links' do
  @links = Link.all
  erb(:'links/index')
end
end
