require 'rspec'
require 'services'


describe ShareANeedService do

  before do
    Need.stub!(:create)
    Need.stub!(:get_errors_with_form).and_return({})

  end

  it "should always send you to the share a need apge" do
    page = ShareANeedService.handle({})     
    page.view.should == :"needs/share"
  end
  describe "when the need is valid" do
    before do
      Need.stub!(:valid?).and_return(true)
    end
    it "should save a need when the submitted need is valid" do
      Need.stub!(:valid?).and_return(true)
      Need.should_receive(:create).with({:description => "Yarp"})
      ShareANeedService.handle({:description =>"Yarp"})
    end
    
    it "the page it creates should have the need on it" do
      Need.stub!(:create).and_return("Yarp")
      page = ShareANeedService.handle({:description => "Yarp"})
      page.need.should == "Yarp"
    end
  
  end
  
  describe "When the need is invalid" do
    before do
      Need.stub!(:valid?).and_return(false)
    end
    it "Should not save a need when the need is invalid" do
      Need.should_not_receive(:create)
      ShareANeedService.handle({})
    end
    it "should have an error when the need is invalid" do
      Need.stub!(:get_errors_with_form).and_return({:description => "aaeeerooosmitherror"})
      ShareNeedPage.should_receive(:new).with({:errors => {:description => "aaeeerooosmitherror"}, :view => :"needs/share"})
      ShareANeedService.handle({});
    end

  end

end