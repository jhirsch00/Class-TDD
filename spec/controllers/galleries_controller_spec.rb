require 'spec_helper'

describe GalleriesController do
  
  context "logged in" do
    
    describe "GET" do
      
      let(:user) { Factory :user }
      let(:gallery) { Factory(:gallery, :user => user) }
    
      context "on GET to :show for first record" do
        
        before do
           @controller.current_user = user
          get :show, :id => gallery.id
        end
        
        it { should assign_to(:gallery).with(gallery) }
        it { should respond_with :success }
        it { should render_template :show }
        it { should_not set_the_flash }
      end
      
      context "on GET to :show for second user" do
        
        before do
           @controller.current_user = Factory :user
          get :show, :id => gallery.id
        end
        
        xit { should assign_to(:gallery).with(gallery) }
        it { should respond_with :redirect }
        it { should redirect_to galleries_path }
        it { should set_the_flash }
      end
    
    end
  
  end

end