require 'page'

describe Page do
  describe "getting the view" do
    it "should return :view_stuff when the view is created with this" do
      page = Page.new({:view => :view_stuff})
      page.view.should == :view_stuff
    end

    it "should return :other_stuff when the view is created with this" do
      page = Page.new({:view => :other_stuff})
      page.view.should == :other_stuff
    end
  end

  describe "has no errors" do
    it "when created with empty errors object" do
      page = Page.new({:errors => {}})
      page.has_errors?.should == false
    end

    it "when created with no errors object" do
      page = Page.new({})
      page.has_errors?.should == false
    end

  end
  describe "has no specific errors" do
    it "when created normally" do
      page = Page.new({:errors => {}})
      page.has_error?(:name).should == false
      page.has_error?(:email).should == false
    end

  end
  describe "has specific errors" do
    it "when created with a name error" do
      page = Page.new({:errors => {:name => "Empty name."}})
      page.has_error?(:name).should == true
    end
    it "when created with an email error" do
      page = Page.new({:errors => {:email => "Invalid email."}})
      page.has_error?(:email).should == true
    end
  end
  describe "has general errors" do
    it "when created with any error" do
      page = Page.new({:errors => {:email => "Invalid email."}})
      page.has_errors?.should == true
    end
  end
end

describe ShareNeedPage do

  it "says it does not succeed if there are errors" do
    page = ShareNeedPage.new({:errors => {:email=>"yarp"}})
    page.need = "blarp"
    page.succeeded?.should == false
  end
  it "Says it does succeed if there is a need and no errors" do
    page = ShareNeedPage.new({})
    page.need = "blary"
    page.succeeded?.should == true
  end
end