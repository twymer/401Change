require 'change_agent'

Then /^(\w+) should have an error message$/ do | field |
  with_scope('#' + field) do
    page.should have_selector('.error')
  end
end

Then /^(\d+) change agents should exist$/ do |number_of_agents|
  ChangeAgent.count.should == number_of_agents.to_i
end

Then /^I should see a description$/ do
  Then 'I should see "description"'
end