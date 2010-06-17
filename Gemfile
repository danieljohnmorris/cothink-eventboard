source 'http://rubygems.org'
source 'http://gemcutter.org'

# gem 'rails', '3.0.0.beta3'
# gem "pg", :group => :production # for heroku

# Bundle edge Rails instead:
gem 'rails', :git => 'git://github.com/rails/rails.git'
# gem 'rails', :git => 'git://github.com/tiennou/rails.git'

#weird dependancies on server (some of which pull in rails beta4 components)
gem "i18n"
gem "warden"
gem "arel"
gem "mail"

# MAIN APP GEMS
gem "bundler", "0.9.26"
gem 'mysql'
gem 'will_paginate', '3.0.pre'
gem 'acts-as-taggable-on'

# auth
gem "rpx_now"
gem 'devise', :git => 'git://github.com/plataformatec/devise.git'
gem 'devise_rpx_connectable'

# admin
gem 'fastercsv' # for csv importing

# deploy
gem "capistrano"
gem 'danieljohnmorris-shadow_puppet'
# should be: (had to fork & patch & push to gemcutter :-/ )
# gem "shadow_puppet", :git => 'git://github.com/snappycode/shadow_puppet.git', :branch => "master"
gem "exceptional"

# Use unicorn as the web server
# gem 'unicorn'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# testing gems
gem "database_cleaner",               :group => :test
gem "spork",                          :group => :test
gem "cucumber-rails",                 :group => :test
gem "cucumber", "0.7.2",              :group => :test

# gems block copied from tutorial on rails3 with rspec2
gem "rspec-rails",        ">= 2.0.0.beta.10", :git => "git://github.com/rspec/rspec-rails.git"
gem "rspec",              ">= 2.0.0.beta.10", :git => "git://github.com/rspec/rspec.git"
gem "rspec-core",         ">= 2.0.0.beta.10", :git => "git://github.com/rspec/rspec-core.git"
gem "rspec-expectations", ">= 2.0.0.beta.10", :git => "git://github.com/rspec/rspec-expectations.git"
gem "rspec-mocks",        ">= 2.0.0.beta.10", :git => "git://github.com/rspec/rspec-mocks.git"

# gem "webrat",                       :group => :test
gem "selenium-client",                :group => :test # needed with capybara?
gem "capybara",                       :group => :test  # drop in replacement for webrat
gem "launchy",                        :group => :test # so you can do "Then show me the page" :D
gem "hpricot",                        :group => :test
gem "factory_girl",                   :group => :test,
  :git => "git://github.com/szimek/factory_girl.git", :branch => "rails3"
