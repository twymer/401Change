require 'rspec'
require 'services'


describe ChangeAgentService do
  
  it "returns the view for registration succeeded when the form is correctly submitted" do
    ChangeAgent.stub!(:valid?).and_return(true)
    ChangeAgentService.handle({:nickname => 'John Denver', :email => 'john@denver.com'}).should == :'change_agents/success'
  end
  it "returns the view for the change agent page when there are no parameters" do
    ChangeAgentService.handle({}).should == :'change_agents/join'
  end
  it "returns the view for the join page when the parameters are invalid" do
    ChangeAgent.stub!(:valid?).and_return(false)
    ChangeAgentService.handle({:nickname => "James Earl Jones", :email=>"darth_mominous@orgspot"}).should == :'change_agents/join'


  end

end