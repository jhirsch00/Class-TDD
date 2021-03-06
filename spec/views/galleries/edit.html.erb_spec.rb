require 'spec_helper'

describe "galleries/edit.html.erb" do
  before(:each) do
    @gallery = assign(:gallery, stub_model(Gallery,
      :title => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit gallery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => galleries_path(@gallery), :method => "post" do
      assert_select "input#gallery_title", :name => "gallery[title]"
      assert_select "input#gallery_user_id", :name => "gallery[user_id]"
    end
  end
end
