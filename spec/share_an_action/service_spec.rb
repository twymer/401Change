require 'rspec'
require 'services'

describe ShareAnActionService do

  before do
    Action.stub!(:create)
    Action.stub!(:get_errors_with_form).and_return({})
  end

  it "should always send you to the share an action page" do
    page = ShareAnActionService.handle({:splat => []})
    page.view.should == :"actions/share"
  end

  describe "when the action is valid" do
    before do
      Action.stub!(:valid?).and_return(true)
    end
    it "should save an action when the submitted action is valid" do
      Action.stub!(:valid?).and_return(true)
      Action.should_receive(:create).with({:description => "Yarp", :need_id => nil})
      ShareAnActionService.handle({:description =>"Yarp", :splat => []})
    end
  end
  
  describe "When the action is invalid" do
    before do
      Action.stub!(:valid?).and_return(false)
    end
    it "Should not save an action when the need is invalid" do
      Action.should_not_receive(:create)
      ShareAnActionService.handle({:splat => []})
    end
    it "should have an error when the action is invalid" do
      Action.stub!(:get_errors_with_form).and_return({:description => "aaeeerooosmitherror"})
      ShareActionPage.should_receive(:new).with({:need_id => nil, :errors => {:description => "aaeeerooosmitherror"}, :view => :"actions/share"})
      ShareAnActionService.handle({:splat => []});
    end
  end

end
