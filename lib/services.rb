module ChangeAgentService
    def self.handle(params)
      if ChangeAgent.valid?(params)
        :'change_agents/success'
      else
        :'change_agents/join'
      end
    end
end