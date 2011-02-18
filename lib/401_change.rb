require 'sinatra/base'
require 'haml'

class FourOhOneChange < Sinatra::Base
  get '/' do
    haml :index
  end
  get '/change_agents/add' do
    haml :'change_agents/add'
  end
end


