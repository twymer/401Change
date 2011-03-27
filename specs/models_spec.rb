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

    it "should return false when the description contains < so no HTML is allowed" do
      Need.valid?({:description => "<p>hi</p>"}).should == false
    end

    it "should return false when the description is longer than 800 characters" do
      Need.valid?({:description => "1"*801}).should == false
    end

    it "should return false when the latitude is not a number" do
      Need.valid?({:description => "desc", :latitude => "invalid", :longitude => "34.23" }).should == false
    end

    it "should return false when the longitude is not a number" do
      Need.valid?({:description => "desc", :latitude => "34.23", :longitude => "invalid"}).should == false
    end

    it "should return false when longitude is specified" do
      Need.valid?({:description => "desc", :longitude => "34.23"}).should == false
    end 

    it "should return false when latitude is specified" do
      Need.valid?({:description => "desc", :latitude => "56.23"}).should == false
    end 

    it "should return false when latitude is valid but longitude is empty string" do
      Need.valid?({:description => "desc", :latitude => "56.23", :longitude =>""}).should == false
    end 

    it "should return false when longitude is valid but latitude is empty string" do
      Need.valid?({:description => "desc", :latitude => "", :longitude =>"45"}).should == false
    end 

    it "should return true when latidue and longitude are both empty strings" do
      Need.valid?({:description => "desc", :latitude => "", :longitude =>""}).should == true
    end 
    
    it "shouldn't accept latitude and longitude outside of real bounds" do
      Need.has_valid_coordinates({:latitude => "0", :longitude => "-180.001"}).should == false
      Need.has_valid_coordinates({:latitude => "0", :longitude => "180.001"}).should == false
      Need.has_valid_coordinates({:latitude => "90.5", :longitude => "0"}).should == false
      Need.has_valid_coordinates({:latitude => "-91", :longitude => "0"}).should == false
      Need.has_valid_coordinates({:latitude => "-89", :longitude => "179"}).should == true
      Need.has_valid_coordinates({:latitude => "89", :longitude => "-179"}).should == true
    end

  end
  
  describe "what happens when we ask for errors" do
  
    it "should not have any errors if the description is not empty" do
      Need.get_errors_with_form({:description => "matthew is starting to lose it!"}).should be_empty
    end
    
    it "should be no erros when there no parameters" do
      Need.get_errors_with_form({}).should be_empty
    end
    it "should have some kind of crazy errors when there is an invalid location coming in" do
      Need.get_errors_with_form({:description => "valid", :latitude => "34"}).should have_key :location
    end
  
  end
  
end
