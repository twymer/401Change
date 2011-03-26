require 'rspec'
require 'change_agent'

describe ChangeAgent do
  it 'starts with zero change agents' do
    ChangeAgent.count.should == 0
  end

  describe "Validation" do
    it 'should be invalid if params is empty' do
      ChangeAgent.valid?({}).should == false
    end
    describe "when valid" do
      it 'when both name and email are valid' do
        ChangeAgent.valid?({:name => "Superman", :email => "clark@kent.com"}).should == true
      end
      it 'gives us no errors' do
        ChangeAgent.get_errors_with_form({}).should be_empty
      end

    end
    describe "when email is an empty string" do
      it 'it is invalid' do
        ChangeAgent.valid?({:name => "No Email", :email => ""}).should == false
      end
      it 'gives us an email error message' do
        errors = ChangeAgent.get_errors_with_form({:email => ""})
        errors.should have_key :email
      end
    end
    describe "name is invalid" do
      it 'when it is empty string' do
        ChangeAgent.valid?({:name => "", :email => "forgotmyname@gmail.com"}).should == false
      end
      it 'gives us a name error message' do
        errors = ChangeAgent.get_errors_with_form({:name => ""})
        errors.should have_key :name
      end
    end

  end


end



