Factory.define :event do |e|
  e.start_date Time.now
  e.title 'Event ' + rand(3).to_s
  e.location 'Place ' + rand(3).to_s
end