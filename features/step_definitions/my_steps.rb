
Then /^(\w+) should have an error message$/ do | field |
  with_scope('#' + field) do
    page.should have_selector('.error')
  end
end

Then /^(\d+) change agents should exist$/ do | number_of_agents |
  ChangeAgent.count.should == number_of_agents.to_i
end

Then /^I should see a description$/ do
  page.should have_selector('#description')
end

Then /^I should get confirmation that registration succeeded$/ do
  page.should have_selector('#registration_succeeded')
  page.should_not have_selector('.error')
end


When /^properly submit the registration$/ do
  fill_in('email', :with => 'john@denver.com')
  fill_in('name', :with => 'John Denver')
  click_button("Complete Registration")

end

Then /^I should get told that registration failed$/ do
  page.should_not have_selector('#registration_succeeded')
  page.should have_selector('#registration_failed')
end

When /^I register with an invalid email$/ do
  fill_in('email', :with => '')
  fill_in('name', :with => 'What is email')
  click_button("Complete Registration")
end

And /^(\w+) should not have an error message$/ do | field |
  with_scope('#' + field) do
    page.should_not have_selector('.error')
  end
end

When /^I submit a valid need$/ do
  fill_in('description', :with => 'this is a viable description - beat up hobo')
  click_button("Share Need")
end

Then /^I should have a need$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should get confirmation that sharing succeeded$/ do
  page.should have_selector('#sharing_succeeded')
  page.should_not have_selector('.error')
end

Then /^I should see all the needs$/ do
  page.should have_selector('ul#needs')
end

Given /^there is a "([^"]*)" need$/ do |arg1|
  @needs_array = [arg1]
end

Then /^I should see a "([^"]*)" need on the list$/ do |arg1|
  page.should have_selector("li", :text => arg1)
end

Then /^there should be a need in the database$/ do
  Need.find(:all).count.should > 0
end

Given /^the following needs$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
	  need = Need.create(:description => hash[:description])
  end
end

