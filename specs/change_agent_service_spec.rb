require 'rspec'
require 'services'


describe ChangeAgentService do


  describe "figuring out which view to use" do
    before do
      mock(Page)
    end
    it "create a page with the view for registration succeeded when the form is correctly submitted" do
      ChangeAgent.stub!(:valid?).and_return(true)
      Page.should_receive(:new).with({:view=>:"change_agents/success"})
      ChangeAgentService.handle({:name => 'John Denver', :email => 'john@denver.com'})

    end
    it "returns the view for the change agent page when there are no parameters" do
      Page.should_receive(:new).with({:view=>:"change_agents/join"})
      ChangeAgentService.handle({})
    end
    it "creates a page with a view for the join page when the parameters are invalid" do
      ChangeAgent.stub!(:valid?).and_return(false)
      Page.should_receive(:new).with({:view=>:"change_agents/join"})
      ChangeAgentService.handle({:name => "", :email=>""})
    end
    it "returns the page object that it instantiates" do
      Page.stub!(:new).and_return("asdf")
      page = ChangeAgentService.handle({})
      page.should == "asdf"
    end
  end


end