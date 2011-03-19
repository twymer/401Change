module ChangeAgentService
    def self.handle(params)
      if params.empty? || !ChangeAgent.valid?(params)
        :'change_agents/join'
      else
        :'change_agents/success'
      end
    end
end