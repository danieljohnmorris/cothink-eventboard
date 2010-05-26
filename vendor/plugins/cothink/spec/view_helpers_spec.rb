require File.dirname(__FILE__) + '/../lib/helpers/view'

describe Cothink::Helpers::View do
  helper = Cothink::Helpers::View
  
  # mock the view that will have ActionHelper modules mixed into it, as well as our new helper
  testview = Object.new
  class << testview
    def truncate okok, d ,ed
      'called truncate'
    end
    include Cothink::Helpers::View
  end
  
  
  it "should truncate a string to its first sentence if under max" do
    testview.truncate_first_sentence("Hello, this is a short sentence. Extra stuff here",40).should == "Hello, this is a short sentence."
  end
  
  it "should pass off to the normal truncate function otherwise, ignoring sentance" do
    
    testview.truncate_first_sentence("Hello, this is a short sentence. Extra stuff here", 20, '...').should == "called truncate"
  end
end