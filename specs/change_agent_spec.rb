require 'rspec'
require 'change_agent'

describe ChangeAgent do
  it 'starts with zero change agents' do
    ChangeAgent.count.should == 0
  end
end



