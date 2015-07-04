source 'https://rubygems.org'
ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem "rack-timeout"

# Use postgres as the database for Active Record
gem 'pg'

gem 'sass-rails', '~> 4.0.0'
gem 'haml-rails'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

gem 'compass-rails'
gem 'zurb-foundation', '~> 4.0.0'
gem 'breakpoint'

gem "seedbank"

gem "paperclip", "~> 3.5.1"
gem 'pg_search'
gem 'will_paginate', '~> 3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use byebug
gem 'byebug', group: [:development, :test]

group :development do
  gem 'rails-admin-scaffold'
  gem 'quiet_assets'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rb-fsevent'
  gem 'rack-livereload'
end

group :production do
  gem 'aws-sdk', '< 2.0'
  gem 'rails_12factor'
  gem 'unicorn'
end