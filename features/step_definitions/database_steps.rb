Given /^There are no "([^"]*)"$/ do |model_name|
  DatabaseCleaner.clean_with :truncation, {:only => [model_name.tableize]}
end