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
  
  describe "what happens when we ask for errors" do
  
    it "should not have any errors if the description is not empty" do
      Need.get_errors_with_form({:description => "matthew is starting to lose it!"}).should be_empty
    end
    
    it "should have some kind of crazy errors when there is no description coming in" do
      Need.get_errors_with_form({}).should have_key :description
    end
  
  end
  
end