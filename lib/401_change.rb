require 'sinatra/base'
require 'haml'
require 'dm-core'
require 'dm-migrations'
require 'services'

class FourOhOneChange < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/causes/add' do
    haml :'causes/add'
  end

  get '/change_agents/join' do
    @page = ChangeAgentService.handle(params)
    haml @page.view
  end

  get '/change_agents/are' do
    haml :'change_agents/are'
  end
  
  get '/share_a_need' do
    haml :'share_a_need'
  end

  get '/find_a_need' do
    haml :'find_a_need'
  end
end
