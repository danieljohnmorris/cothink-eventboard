require 'spec_helper' 

describe "home/index.html.erb" do 
  
  context "when no events given" do
    
    before :each do
      assigns[:events] = []
    end
    
    it "should display a helpful message saying there were none found" do
      render
      p response
      response.should contain("Ooops, couldn't find any events. Try being less specific about the type of event.")
    end
  end
  
  context "given a list of events" do
    
    before :each do
      assigns[:events] = [stub("Event"),stub("Event")]
    end
   
    it "should render a list of events"
    it "should render the events in a calendar format"
    it "should display a booking link"
  end
  
end 
