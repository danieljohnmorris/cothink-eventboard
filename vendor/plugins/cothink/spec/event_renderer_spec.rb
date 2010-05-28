require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/../lib/helpers/view'
require File.dirname(__FILE__) + '/factories'

describe Cothink::Helpers::View do
  helper = Cothink::Helpers::View
  
  # mock the view that will have ActionHelper modules mixed into it, as well as our new helper
  testview = Object.new
  class << testview
    include Cothink::Helpers::View
  end
  
  test_start = Time.parse('2010-06-01')
  
  for i in 1..30
    (@events ||= []).push Factory.build(:event, :start_date => test_start + 1.days)
  end
  
  it "should split up items by weeks" do
    
    testview.render_events 
    
    
  end
  
end