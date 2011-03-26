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
