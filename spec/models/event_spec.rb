require 'spec_helper'

describe Event do
  
  event_times = ['18-10-2010 19:00','18-10-2010 19:30','18-10-2010 19:06','12-10-2010 11:00','12-10-2010 12:00','12-10-2010 1:00']
  event_expects = [[7,'pm',18],['7.30','pm',18],['7.06','pm',18],['11','am',12],['12','pm',12],['1','am',12]]
  
  month = 'Oct'
  
  indx = 0
  event_times.each do |time|
    time, ampm, day = event_expects[ indx ]
    
    event = Event.new(:start_time => time)
    
    it "should present a nicely formatted start time" do
      event.start_time_.should == time
    end
    it "should know if it has an am or a pm start" do
       event.start_ampm.should == ampm
     end
    it "should present a nicely formatted start dau" do
      event.formatted_start_date.should == day
    end
    it "should present a nicely formatted start month" do
      event.formatted_start_date.should == month
    end
    
    indx += 1
  end
  
end
