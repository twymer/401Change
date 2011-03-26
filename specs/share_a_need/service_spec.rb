require 'rspec'
require 'services'


describe ShareANeedService do

  before do
    mock(Page)
    Need.stub!(:create)
    Need.stub!(:get_errors_with_form).and_return({})
    Need.stub!(:valid?).and_return(false)
  end
  describe "figuring out which view to use" do
    
    it "should return to the share a need page if there is no description" do
      Page.should_receive(:new).with({:view=>:"needs/share", :errors=>{}})
      ShareANeedService.handle({})     
    end

  end
  
  describe "saving a need" do
    it "should save a need when the submitted need is valid" do
      Need.stub!(:valid?).and_return(true)
      Need.should_receive(:create).with({:description => "Yarp"})
      ShareANeedService.handle({:description =>"Yarp"})
    end
  
    it "Shoyld not save a need when the need is invalid" do
      Need.should_not_receive(:create)
      ShareANeedService.handle({})
    end
    it "should have an error when the need is invalid" do
      Need.stub!(:get_errors_with_form).and_return({:description => "aaeeerooosmitherror"})
      Page.should_receive(:new).with({:errors => {:description => "aaeeerooosmitherror"}, :view => :"needs/share"})
      ShareANeedService.handle({});
    end

  end

end