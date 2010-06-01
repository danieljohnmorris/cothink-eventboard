require File.dirname(__FILE__) + '/../lib/helpers/date'
require 'date'
describe Cothink::Helpers::Date do
  
  include Cothink::Helpers::Date
  
  it "should return the monday of any specified date correctly" do
    
    tests = [['2010-05-3','2010-05-3'],['2010-05-9','2010-05-3'],['2010-05-14','2010-05-10'],['2010-05-31','2010-05-31'],
             ['2010-06-01','2010-05-31'], ['2010-04-02','2010-03-29']]
    
    tests.each do |test_arr| 
      
      date, the_monday = test_arr
      monday_of_week_containing(Date.parse(date)).should == Date.parse(the_monday)

    end
    
  end
  
  it "should return the correct difference in weeks of any date" do
    
    tests = [['2010-05-4','2010-05-3',0],['2010-05-9','2010-05-3',0],['2010-05-14','2010-05-3',1],['2010-04-02','2010-03-29',0],['2010-06-01','2010-05-31',0],['2010-06-01','2010-05-04',4],['2010-05-04','2010-06-01',-4],['2010-05-25','2010-06-01',-1]]
    
    tests.each do |test_arr| 
      future_date, comparison, diff = test_arr
      
      weeks_in_future_of(Date.parse(future_date),Date.parse(comparison)).should == diff
      
    end
  end
end