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

Then /^I should get confirmation that registration succeeded$/ do
  page.should have_selector('#registration_succeeded')
  page.should_not have_selector('.error')
end


When /^properly fill out the registration$/ do
  fill_in('email', :with => 'john@denver.com')
  fill_in('name', :with => 'John Denver')
end

Then /^I should get told that registration failed$/ do
  page.should_not have_selector('#registration_succeeded')
  page.should have_selector('#registration_failed')
end
