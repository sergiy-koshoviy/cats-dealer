source 'https://rubygems.org'

gem 'rails', '~> 5.1.1'
gem 'redis'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'sqlite3'

gem 'puma'
gem 'rest-client'

gem 'bootstrap-sass', '~> 3.4.1'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :test do
  gem 'database_cleaner'
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'vcr'
  gem 'webmock'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
end
