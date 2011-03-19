require 'page'

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