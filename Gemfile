source 'https://rubygems.org'
ruby '2.4.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
gem "rack-timeout"

# Use postgres as the database for Active Record
gem 'pg'

gem 'sass-rails'
gem 'haml-rails'

gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'

gem 'compass-rails'
gem 'zurb-foundation'
gem 'breakpoint'

gem "seedbank"

gem "paperclip"
gem "pg_search"
gem 'will_paginate'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use Capistrano for deployment
gem 'capistrano', group: :development

# Use byebug
gem 'byebug', group: [:development, :test]

group :development do
  gem 'rails-admin-scaffold'
  # gem 'quiet_assets'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rb-fsevent'
  gem 'rack-livereload'
end

group :production do
  gem 'aws-sdk'
  gem 'rails_12factor'
  gem 'unicorn'
end
