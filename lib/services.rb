require 'page'
require 'change_agent'
require 'models'

module ChangeAgentService
  def self.get_view_name(params)
    if ChangeAgent.valid?(params)
      :'change_agents/success'
    else
      :'change_agents/join'
    end
  end
  def self.handle(params)
    Page.new(:view=>get_view_name(params), :errors=>ChangeAgent.get_errors_with_form(params))
  end
end

module ShareANeedService
  def self.handle(params)
    page = ShareNeedPage.new(:view=> :'needs/share', :errors=> Need.get_errors_with_form(params))    
    if(Need.valid?(params)) 
      page.need = Need.create(params)  
    end
    page
  end
end

module ShareAnActionService
  def self.handle(params)
    need_id = params[:splat][0]
    page = ShareActionPage.new(:view => :'actions/share', 
							:need_id => need_id, 
							:errors => Action.get_errors_with_form(params))    

    if(Action.valid?(params)) 
      puts "BLAAAAAAAAH"
      page.action = Action.create(params)
    end
    page
  end
end
