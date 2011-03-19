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

    end
    describe "email is invalid" do
      it 'when it is empty string' do
        ChangeAgent.valid?({:name => "No Email", :email => ""}).should == false
      end
    end
    describe "name is invalid" do
      it ' when it is empty string' do
        ChangeAgent.valid?({:name => "", :email => "forgotmyname@gmail.com"}).should == false
      end
    end

  end


end



