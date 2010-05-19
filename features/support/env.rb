require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
  require 'cucumber/rails/rspec'
  require 'cucumber/rails/world'
  require 'cucumber/rails/active_record'
  require 'cucumber/web/tableish'

  require 'webrat'
  require 'webrat/core/matchers'

  Webrat.configure do |config|
    config.mode = :rails
    config.open_error_files = false # Set to true if you want error pages to pop up in the browser
  end

  if defined?(ActiveRecord::Base)
    begin
      require 'database_cleaner'
      DatabaseCleaner.strategy = :truncation
    rescue LoadError => ignore_if_database_cleaner_not_present
    end
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
  #require 'cucumber/rails/world'
  #Cucumber::Rails.use_transactional_fixtures
  #Cucumber::Rails.bypass_rescue # Comment out this line if you want Rails own error handling 
                                # (e.g. rescue_action_in_public / rescue_responses / rescue_from)
end