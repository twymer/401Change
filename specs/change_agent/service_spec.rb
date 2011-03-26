require 'rspec'
require 'services'


describe ChangeAgentService do

  before do
    mock(Page)
    ChangeAgent.stub!(:get_errors_with_form).and_return({})
    ChangeAgent.stub!(:valid?).and_return(false)
  end
  describe "figuring out which view to use" do

    it "create a page with the view for registration succeeded when the form is correctly submitted" do
      ChangeAgent.stub!(:valid?).and_return(true)
      Page.should_receive(:new).with({:view=>:"change_agents/success", :errors=>{}})
      ChangeAgentService.handle({:name => 'John Denver', :email => 'john@denver.com'})
    end
    it "returns the view for the change agent page when there are no parameters" do
      Page.should_receive(:new).with({:view=>:"change_agents/join", :errors=>{}})
      ChangeAgentService.handle({})
    end
    it "creates a page with a view for the join page when the parameters are invalid" do
      Page.should_receive(:new).with({:view=>:"change_agents/join", :errors=>{}})
      ChangeAgentService.handle({:name => "", :email=>""})
    end
    it "returns the page object that it instantiates" do
      Page.stub!(:new).and_return("asdf")
      page = ChangeAgentService.handle({})
      page.should == "asdf"
    end
  end

  describe "Putting errors into the page" do
    it "gives the page the Errors that the ChangeAgent has" do
      errors = {:name=>"you stupid that name taken!"}
      ChangeAgent.stub!(:get_errors_with_form).and_return(errors)
      Page.should_receive(:new).with(:view=>:"change_agents/join", :errors=>errors)
      ChangeAgentService.handle({:name=>"asdf", :email=>"adsgsag@sdgag.com"})
    end
  end


end