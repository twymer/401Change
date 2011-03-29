require 'sinatra/base'
require 'haml'
require 'services'
require 'sinatra/activerecord'  
require 'json'


class FourOhOneChange < Sinatra::Base
  get '/' do
    @needs = Need.order('id DESC').find(:all)
    haml :'needs/find'
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

  get '/view_actions' do
    @actions = Action.order('id DESC').find(:all)
    haml :'actions/view'
  end

  get '/share_an_action/?*' do
    @page = ShareAnActionService.handle(params)
    haml @page.view
  end
  
  get '/js/*' do
  
  end
end



