require 'spec_helper'

describe "admin_events/index.html.erb" do
  before(:each) do
    assign(:admin_events, [
      stub_model(Admin::Event,
        :title => "MyString",
        :description => "MyText",
        :location => "MyText",
        :url => "MyString",
        :telephone => "MyString",
        :email => "MyString",
        :people => "MyText",
        :notes => "MyText",
        :organisation => ""
      ),
      stub_model(Admin::Event,
        :title => "MyString",
        :description => "MyText",
        :location => "MyText",
        :url => "MyString",
        :telephone => "MyString",
        :email => "MyString",
        :people => "MyText",
        :notes => "MyText",
        :organisation => ""
      )
    ])
  end

  it "renders a list of admin_events" do
    render
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "".to_s, :count => 2)
  end
end
