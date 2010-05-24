require 'spec_helper'

describe "admin_events/show.html.erb" do
  before(:each) do
    assign(:event, @event = stub_model(Admin::Event,
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

  it "renders attributes in <p>" do
    render
    response.should contain("MyString")
    response.should contain("MyText")
    response.should contain("MyText")
    response.should contain("MyString")
    response.should contain("MyString")
    response.should contain("MyString")
    response.should contain("MyText")
    response.should contain("MyText")
    response.should contain("")
  end
end
