Given /^There are no "([^"]*)"$/ do |model|
  the_model = model.camelize.constantize.new
  DatabaseCleaner.clean_with :truncation, {:only => the_model.tableize}
end