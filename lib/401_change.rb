require 'sinatra/base'
require 'haml'
require 'services'
require 'sinatra/activerecord'  

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
    @page = ShareANeedService.handle(params)
    haml @page.view
  end

  get '/find_a_need' do
    @needs = Need.find(:all)
    haml :'find_a_need'
  end

  get '/share_an_action/*' do
    @page = ShareAnActionService.handle(params)
    haml @page.view
  end

#  get '/share_an_action/:id' do
#    @page = ShareAnActionService.handle(params)

end



