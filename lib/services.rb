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
  def self.get_view_name(params)
    if(Need.valid?(params))
      :'needs/success'
    else
      :'needs/share'
    end
  end

  def self.handle(params)
    if(Need.valid?(params)) 
      Need.create(params)  
    end

    Page.new(:view=> get_view_name(params), :errors=> Need.get_errors_with_form(params))    
  end
end

module ShareAnActionService
  def self.get_view_name(params)
    if(Action.valid?(params))
      :'actions/success'
    else
      :'actions/share'
    end
  end

  def self.handle(params)
    if(Action.valid?(params)) 
      Action.create(params)  
    end

    Page.new(:view=> get_view_name(params), :errors=> Action.get_errors_with_form(params))    
  end
end
