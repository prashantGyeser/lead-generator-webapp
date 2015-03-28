source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
#gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'pg'

#gem 'aws-sdk', '~> 1.0'

gem 'devise'

gem 'human_date'

gem 'bootstrap-sass', '~> 3.3.0'
gem 'autoprefixer-rails'

# Twitter integration
gem 'omniauth'
gem 'omniauth-twitter'

# Env config info
gem "figaro"

# Message queue
#gem 'iron_mq'

#gem 'httparty'

gem 'twitter'

gem 'honeybadger'

gem 'gon'

gem 'delayed_job_active_record'

gem 'devise_invitable'

gem 'by_star', :git => "git://github.com/radar/by_star"

gem 'geocoder'

gem 'will_paginate', '~> 3.0.6'

gem "letter_opener", :group => :development

gem 'newrelic_rpm'

gem 'unicorn'

gem 'rails_autolink'

gem 'librato-rails'

gem "hublot", "~> 0.0.6"

gem "dotiw"

gem "awesome_print", require:"ap"

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'database_cleaner', git: 'git@github.com:bmabey/database_cleaner.git'
  gem 'annotate'
  gem 'faker'
  #gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
end

group :development do
  #gem 'ruby-debug'
  gem 'reek'
  gem "bullet"
  gem 'rack-mini-profiler'
  gem 'quiet_assets'
end


group :test do
  gem 'shoulda-matchers'
end

group :production do
  gem 'rails_12factor'
end