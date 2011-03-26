require 'models'

describe Need do
  
  describe "how valid works" do
  
    it "should return false when it has no description" do
      Need.valid?({}).should == false
    end
    
    it "should return true when it has a valid description" do
      Need.valid?({:description => "any description should work"}).should == true
    end
    
    it "should return false when the description passed is an empty string" do
      Need.valid?({:description => ""}).should == false
    end
  
  end
  
  
end