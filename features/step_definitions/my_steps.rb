Then /^change agents should exist with the following values:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^no change agents should exist$/ do
  ChangeAgents.all.length.should == 0
end
