When /^I submit a valid need$/ do
  fill_in('description', :with => 'this is a viable description - beat up hobo')
  click_button("Share Need")
end

When /^I submit an invalid need$/ do
  click_button("Share Need")
end

Then /^I should get confirmation that sharing succeeded$/ do
  page.should have_selector('#sharing_succeeded')
  page.should_not have_selector('.error')
end

Then /^there should be a need in the database$/ do
  Need.find(:all).count.should > 0
end

Then /^I should get told that sharing failed$/ do
  page.should have_selector('#sharing_failed')
  page.should_not have_selector('#sharing_succeeded')
end