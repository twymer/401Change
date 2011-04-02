require 'rspec'
require 'services'


describe ChangeAgentService do

  before do
    mock(Page)
    ChangeAgent.stub!(:get_errors_with_form).and_return({})
    mock(Need)
  end
  
  describe "Saving a valid need" do
    before do
      ChangeAgent.stub!(:valid?).and_return(true)
    end
    it "create a page with the view for registration succeeded when the form is correctly submitted" do
      Page.should_receive(:new).with({:view=>:"change_agents/success", :errors=>{}})
      ChangeAgentService.handle({:name => 'John Denver', :email => 'john@denver.com'})
    end  
  end
  describe "Saving an invalid need" do
    before do
       ChangeAgent.stub!(:valid?).and_return(false)
    end
    it "Shouldn't save the need" do
      Need.should_not_receive(:create)
      ChangeAgentService.handle({})
    end
    describe "figuring out which view to use" do

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

end