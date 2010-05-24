require 'spec_helper'

describe "admin_organisations/new.html.erb" do
  before(:each) do
    assign(:organisation, stub_model(Admin::Organisation,
      :new_record? => true,
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new organisation form" do
    render

    response.should have_selector("form", :action => admin_organisations_path, :method => "post") do |form|
      form.should have_selector("input#organisation_name", :name => "organisation[name]")
      form.should have_selector("input#organisation_url", :name => "organisation[url]")
    end
  end
end
