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
