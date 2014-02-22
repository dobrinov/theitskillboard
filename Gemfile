source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem "compass-rails", "~> 1.1.2"
gem 'uglifier', '>= 1.3.0'
gem 'therubyrhino'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'slim'
gem 'redirectr', '~> 0.0.8'
gem "paperclip", "~> 3.0"
gem 'font-awesome-sass'

group :doc do
  gem 'sdoc', require: false
end

group :assets do
  gem 'coffee-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'capybara'
end

group :test do
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end