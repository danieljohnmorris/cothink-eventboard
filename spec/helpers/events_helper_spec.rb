require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
# 
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe EventsHelper do
  
  test_start = Time.parse('2010-06-01')
  
  for i in 0..29
    (@events ||= []).push Factory.build(:event, :start_date => test_start + 1.days)
  end
  
  
  
  it "should split up items by weeks" do
    eventout = Hpricot(helper.render_events(@events))
    (eventout/".week").length.should == 5
    
  end
  
  it "should display the weeks in a next week, week of the x format" do
    
     eventout = Hpricot(helper.render_events(@events))
     for i in 0..(eventout/".week").length 
       (eventout/".week")[i].inner_html.should == EventsHelper.class_variable_get(@@week_formats)[i]
     end
    
  end
  
  it "should generate a calendar page for each distinct date" do
    
    eventout = Hpricot(helper.render_events(@events))
    (eventout/".event-calendar-page").length.should == 30
    
  end
end
