require 'sinatra/base'
require 'haml'
require 'dm-core'
require 'dm-migrations'


class FourOhOneChange < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/causes/add' do
    haml :'causes/add'
  end

  get '/change_agents/join' do
    haml :'change_agents/join'
  end

  get '/change_agents/are' do
    haml :'change_agents/are'
  end
end