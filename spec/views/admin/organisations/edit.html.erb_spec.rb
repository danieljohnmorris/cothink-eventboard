require 'spec_helper'

describe "admin_organisations/edit.html.erb" do
  before(:each) do
    assign(:organisation, @organisation = stub_model(Admin::Organisation,
      :new_record? => false,
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit organisation form" do
    render

    response.should have_selector("form", :action => organisation_path(@organisation), :method => "post") do |form|
      form.should have_selector("input#organisation_name", :name => "organisation[name]")
      form.should have_selector("input#organisation_url", :name => "organisation[url]")
    end
  end
end
