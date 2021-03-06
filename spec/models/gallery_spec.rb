require 'spec_helper'

describe Gallery do
  
  context "validations" do
  
    subject { Factory :gallery }
  
    [:title].each do |attr|
      it "must have a #{ attr }" do
        subject.send "#{ attr }=", nil
        subject.should_not be_valid
        subject.errors[attr].should_not be_empty
      end
    end
  
  end
  
  context "associations" do
    subject { Factory :gallery }
    it { should belong_to :user }
  end
  
end
