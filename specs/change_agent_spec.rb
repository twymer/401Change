require 'rspec'
require 'change_agent'

describe ChangeAgent do
  it 'starts with zero change agents' do
    ChangeAgent.count.should == 0
  end

  it 'should be invalid if params is empty' do
    ChangeAgent.valid?({}).should == false
  end

  it 'should be valid if name and email are valid' do
    ChangeAgent.valid?({:name => "Superman", :email => "clark@kent.com"}).should == true
  end
end



