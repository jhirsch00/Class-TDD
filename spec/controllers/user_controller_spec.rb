require 'spec_helper'

describe UsersController do
  
  context "logged in" do
    
    before do
      @controller.current_user = Factory :user
    end

    describe "GET" do
    
      before do
        get :show, :id => 1
      end
      let(:gallery) { Factory :gallery }
    
      context "on GET to :show for first record" do
        it { should assign_to(:gallery).with(gallery) }
        it { should assign_to :user }
        it { should respond_with :success }
        it { should render_template :show }
        it { should_not set_the_flash }
      end
    
    end
  
  end

end