require 'page'

describe Page do
  it "should return :view_stuff when the view is initialized with this" do
    page = Page.new({:view => :view_stuff})
    page.view.should == :view_stuff
  end

  it "should return :other_stuff when the view is initialized with this" do
    page = Page.new({:view => :other_stuff})
    page.view.should == :other_stuff
  end

  it "should have errors when initialized with an error" do
    page = Page.new({:errors => {:email => "Invalid email."}})
    page.has_errors?.should == true
  end

  it "should not have errors when initialized with no errors" do
    page = Page.new({:errors => {}})
    page.has_errors?.should == false
  end

  it "should not have errors when initialized with no errors object" do
    page = Page.new({})
    page.has_errors?.should == false
  end

  it "should have name error when initialized with a name error" do
    page = Page.new({:errors => {:name => "Empty name."}})
    page.has_error?(:name).should == true
  end

  it "should not have name error when initialized correctly" do
    page = Page.new({:errors => {}})
    page.has_error?(:name).should == false
  end

  it "should have a email error when initialized with an email error" do
    page = Page.new({:errors => {:email => "Invalid email."}})
    page.has_error?(:email).should == true
  end
end