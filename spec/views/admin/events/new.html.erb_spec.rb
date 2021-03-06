require 'spec_helper'

describe "admin_events/new.html.erb" do
  before(:each) do
    assign(:event, stub_model(Admin::Event,
      :new_record? => true,
      :title => "MyString",
      :description => "MyText",
      :location => "MyText",
      :url => "MyString",
      :telephone => "MyString",
      :email => "MyString",
      :people => "MyText",
      :notes => "MyText",
      :organisation => ""
    ))
  end

  it "renders new event form" do
    render

    response.should have_selector("form", :action => admin_events_path, :method => "post") do |form|
      form.should have_selector("input#event_title", :name => "event[title]")
      form.should have_selector("textarea#event_description", :name => "event[description]")
      form.should have_selector("textarea#event_location", :name => "event[location]")
      form.should have_selector("input#event_url", :name => "event[url]")
      form.should have_selector("input#event_telephone", :name => "event[telephone]")
      form.should have_selector("input#event_email", :name => "event[email]")
      form.should have_selector("textarea#event_people", :name => "event[people]")
      form.should have_selector("textarea#event_notes", :name => "event[notes]")
      form.should have_selector("input#event_organisation", :name => "event[organisation]")
    end
  end
end
