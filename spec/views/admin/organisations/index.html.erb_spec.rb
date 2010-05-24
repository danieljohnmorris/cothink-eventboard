require 'spec_helper'

describe "admin_organisations/index.html.erb" do
  before(:each) do
    assign(:admin_organisations, [
      stub_model(Admin::Organisation,
        :name => "MyString",
        :url => "MyString"
      ),
      stub_model(Admin::Organisation,
        :name => "MyString",
        :url => "MyString"
      )
    ])
  end

  it "renders a list of admin_organisations" do
    render
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
  end
end
