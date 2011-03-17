Then /^(\d+) causes should exist$/ do |total_causes|
  Cause.count.should == total_causes
end

Then /^(\w+) should have an error message$/ do
  pending # express the regexp above with the code you wish you had
end