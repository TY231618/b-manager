require 'sinatra/base'
require_relative 'models/link'
require 'tilt/erb'

class BManager < Sinatra::Base

  get '/' do
    redirect('/links')
  end
  
  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect('/links')
  end
end
