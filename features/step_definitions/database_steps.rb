Given /^There are no "([^"]*)"$/ do |model_name|
  DatabaseCleaner.clean_with :truncation, {:only => [model_name.tableize]}
end

Given /^there are "(\d+)" random "([^"]*)"$/ do |number_to_create,model|
  for i in 1..number_to_create.to_i
    model.constantize.create!(:title => rand(12), :location => rand(6), :start_date => Time.now)
  end
  p model.constantize.all
end

Given /^pagination items per page for "([^\"]*)" is set to "([^\"]*)"$/ do |model, paginate_amount|
  model.constantize.send(:class_variable_set,:@@per_page,paginate_amount.to_i)
end