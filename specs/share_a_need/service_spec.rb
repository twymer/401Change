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

    it "create a page with the view for share a need succeeded when the form is correctly submitted" do
      Need.stub!(:valid?).and_return(true)
      Page.should_receive(:new).with({:view=>:"needs/success", :errors=>{}})
      ShareANeedService.handle({:description => 'this is a valid description'})
      
    end
    
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
  
    it "should have an error when the need is invalid" do
      Need.stub!(:get_errors_with_form).and_return({:description => "aaeeerooosmitherror"})
      Page.should_receive(:new).with({:errors => {:description => "aaeeerooosmitherror"}, :view => :"needs/share"})
      ShareANeedService.handle({});
    end

  end

end