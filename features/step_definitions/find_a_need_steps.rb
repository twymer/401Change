
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
  pending # express the regexp above with the code you wish you had
end
