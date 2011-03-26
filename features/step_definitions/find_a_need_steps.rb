
Then /^I should see all the needs$/ do
  page.should have_selector('ul#needs')
end

Given /^there is a "([^"]*)" need$/ do |arg1|
  @needs_array = [arg1]
end

Then /^I should see a "([^"]*)" need on the list$/ do |arg1|
  page.should have_selector("li", :text => arg1)
end

Given /^the following needs$/ do |table|
	DatabaseCleaner.clean
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
	  need = Need.create(:description => hash[:description])
  end
end
