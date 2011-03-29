source 'http://rubygems.org'

gem 'rails', '3.0.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# gem "mysql"
gem 'sqlite3-ruby', :require => 'sqlite3'
gem "rspec-rails", ">= 2.4.1", :group => [:development]
gem "remarkable_activerecord", ">=4.0.0.alpha4", :group => :test
gem "factory_girl_rails", "1.1.beta1", :group => :test
gem "jquery-rails"
gem "haml"
gem "haml-rails"
gem "compass"
gem "capybara", "0.4.0", :group => :test
gem "cucumber-rails", :group => :test
gem "launchy", :group => :test

# prawn and prawnto - for generating .pdf
gem "prawn"
gem "prawnto"

# paperclip, for attachments
gem "paperclip"

gem "devise" # authentication

group :test do
  gem 'database_cleaner' # ./features/support/env.rb uses it
end

gem 'ruby-debug' # for the debugger command

gem 'uuidtools' # for generating uuids, see https://github.com/aduffeck/uuid_it

gem 'fancy-buttons' # plugin for compass, pretty buttons
gem 'delayed_job'
