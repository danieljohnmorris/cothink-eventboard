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
  
  
  it "should truncate a string to its first sentence if under max character limit" do
    testview.truncate_first_sentence("Hello, this is a short sentence. Extra stuff here",40).should == "Hello, this is a short sentence."
  end
  
  it "should pass off to the normal truncate function otherwise, ignoring sentance" do
    
    testview.truncate_first_sentence("Hello, this is a short sentence. Extra stuff here", 20, '...').should == "called truncate"
  end
  
  it "should handle non sentances by passing off" do
    testview.truncate_first_sentence("Hello, this is a short sentence Extra stuff here", 20, '...').should == "called truncate"
  end
  
  it "should handle empty strings by passing off" do
    testview.truncate_first_sentence("", 20, '...').should == "called truncate"
  end
  
  it "should handle weird strings" do
     testview.truncate_first_sentence("(H[]££££$$$30eloo). Moo", 50, '...').should == "(H[]££££$$$30eloo)."
   end
   
   it "should intelligently handle times in the string" do
      testview.truncate_first_sentence("See you at 19.00. Moo", 50, '...').should == "See you at 19.00."
    end
   it "should intelligently handle dates in the string" do
        testview.truncate_first_sentence("See you on 12.09.11, ok. Moo", 50, '...').should == "See you on 12.09.11, ok."
   end
   it "should intelligently handle money in the string" do
         testview.truncate_first_sentence("It'll cost you £19.00, cheap. Moo", 50, '...').should == "It'll cost you £19.00, cheap."
  end
  it "should work with exclamation and question marks too" do
    testview.truncate_first_sentence("See you there? Moo", 50, '...').should == "See you there?"
    testview.truncate_first_sentence("See you there! Moo", 50, '...').should == "See you there!"
  end
  
end