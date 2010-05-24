require 'spec_helper'

describe "admin_organisations/show.html.erb" do
  before(:each) do
    assign(:organisation, @organisation = stub_model(Admin::Organisation,
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render
    response.should contain("MyString")
    response.should contain("MyString")
  end
end
