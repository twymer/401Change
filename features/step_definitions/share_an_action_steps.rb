When /^I submit a valid action$/ do
  fill_in('description', :with => 'Fed a guy near the freeway')
  click_button("Share Action")
end

Then /^there should be an action in the database$/ do
  Action.find(:all).count.should > 0
end

