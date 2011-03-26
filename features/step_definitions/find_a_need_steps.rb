Given /^the following needs$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
	  need = Need.create(:description => hash[:description])
  end
end

Then /^I should see all the needs$/ do
  page.should have_selector('ul#needs')
end

Then /^I should see a "([^"]*)" need on the list$/ do |arg1|
  page.should have_selector("li", :text => arg1)
end

