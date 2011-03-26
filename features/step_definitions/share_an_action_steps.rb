When /^I submit a valid action$/ do
  fill_in('description', :with => 'Fed a guy near the freeway')
  click_button("Share Action")
end

Then /^there should be an action in the database$/ do
  Action.find(:all).count.should > 0
end

When /^I follow "([^"]*)" for "([^"]*)"$/ do |arg1, arg2|
  action = Action.find(:description => arg2)
  visit path_to('/share_an_action/' + action.id)
end

@nyi
Then /^need should be "([^"]*)"$/ do |arg1|

end

