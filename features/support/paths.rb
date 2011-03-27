# Taken from the cucumber-rails project.

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

      when /the home\s?page/
        '/'

      when /change agent added\s?page/
        '/change_agent_added'

      when /the become a change agent \s?page/
        '/change_agents/join'
      when /the about change agents page/
        '/change_agents/are'
      when /share a need/
        '/share_a_need'
      when /find a need/
        '/'
      when /share an action/
        '/share_an_action'
      when /view actions/
        '/view_actions'

      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #   when /^(.*)'s profile page$/i
      #     user_profile_path(User.find_by_login($1))
      else
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                  "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
