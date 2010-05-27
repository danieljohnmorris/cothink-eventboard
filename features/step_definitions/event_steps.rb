Given /^there are the following upcoming events$/ do |table|
  @events = []
  table.hashes.each do |event|
    event[:organisation] = Organisation.find_or_create_by_name(event[:organisation])
    @events << Event.create!(event)
  end
end

Then /^I should see a list of upcoming events like this$/ do |table|
  event_hashes = table.hashes
  all('.events-list .event').length.should == 2
  
  # check presence and format
  event_hashes.each do |event|
    event.each do |field,value|
      page.should have_content(value)
    end
  end
  
  # check ordering
  all('.events-list .event h4').each do |event_title|
      expected_event = event_hashes.shift
      event_title.text.should == expected_event['title']
  end
  
end

Then /^I should see "([^\"]*)" events$/ do |events_count|
  all('.events-list .event').length.should == events_count.to_i
end
