# BULK INGEST

When /^I upload a CSV at "([^\"]*)"$/ do |csv_path|
  attach_file('csv_file', File.join(Rails.root, 'features', csv_path))
  click_button "Upload CSV"
end