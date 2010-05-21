require 'spec_helper' 

describe "home/index.html.erb" do 
  it "displays a hello message" do 
    render 
    response.should contain("Hello!") 
  end 
end 
