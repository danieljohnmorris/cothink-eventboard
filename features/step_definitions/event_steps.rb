Given /^there are the following upcoming events$/ do |table|
  @events = []
  table.hashes.each do |event|
    event[:organisation] = Organisation.find_or_create_by_name(event[:organisation])
    @events << Event.create!(event)
  end
end

Then /^I should see a list of upcoming events like this$/ do |table|
  event_hashes = table.hashes
  within('.event-list') do
    all('.event').each do |event|
      expected_event = event_hashes.shift
      event('.title').should have_content(expected_event.title)
    end
  end
end