require 'spec_helper'

describe Photo do
  
  subject { Factory :photo }
  
  context "validations" do
    
    [:title, :gallery_id].each do |attr|
      it "must have a #{ attr }" do
        subject.send "#{ attr }=", nil
        subject.should_not be_valid
        subject.errors[attr].should_not be_empty
      end
    end
    
    it { should have_attached_file :image }
    
  end
  
  context "associations" do
    
    it { should belong_to :gallery }
    
  end
  
end
