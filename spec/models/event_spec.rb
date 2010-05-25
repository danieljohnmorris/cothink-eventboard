require 'spec_helper'

describe Event do
  
  event_times = {'18-10-2010 19:00'=>['7','pm',18],
                 '18-10-2010 19:30'=>['7.30','pm',18],
                 '18-10-2010 19:06'=>['7.06','pm',18],
                 '12-10-2010 11:00'=>['11','am',12],
                 '12-10-2010 12:00'=>['12','pm',12],
                 '12-10-2010 1:00'=>['1','am',12]}
  
  month = 'Oct'
  
  event_times.each_pair do |datetime, event_expects|
    time, ampm, day = event_expects
    
    event = Event.new(:start_date => Time.parse(datetime))
    
    it "should present a nicely formatted start time" do
      event.start_time.should == time
    end
    it "should know if it has an am or a pm start" do
       event.start_ampm.should == ampm
     end
    it "should present a nicely formatted start day" do
      event.start_day.should == day
    end
    it "should present a nicely formatted start month" do
      event.start_month.should == month
    end
    
  end
  
end
