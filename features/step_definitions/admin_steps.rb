# BULK INGEST

When /^I upload a CSV at "([^\"]*)"$/ do |csv_path|
  attach_file('CSV', csv_path)
  click_button "Upload CSV"
end
