source 'https://rubygems.org'

gem 'rails',                  '4.2.2'
gem 'pg'
gem 'jquery-rails'
gem 'sass-rails',             '~> 5.0'
gem 'uglifier',               '>= 1.3.0'
gem 'coffee-rails',           '~> 4.1.0'
gem 'jbuilder',               '~> 2.0'
gem 'simple_form',            '~> 3.2'
gem 'bootstrap-sass',         '~> 3.3.5'
gem 'devise',                 '~> 3.5', '>= 3.5.2'
gem 'haml-rails',             '~> 0.9'
gem 'dotenv-rails',           '~> 2.0.2'
gem 'roo',                    '~> 2.2'
gem 'will_paginate',          '~> 3.0', '>= 3.0.7'
gem 'fog'
gem 's3'
gem 'ffaker',                 '~> 2.1.0'
gem 'draper',                 '~> 2.1'
gem 'datagrid',               '~> 1.4.2'
gem 'active_model_serializers'
gem 'sinatra',                require: false
gem 'rack-cors',              require: 'rack/cors'
gem 'rails-erd'
gem 'phony_rails',            '~> 0.12.11'
gem 'typhoeus'
gem 'foreman',                '~> 0.78.0'
gem 'cancancan',              '~> 1.13', '>= 1.13.1'
gem 'ckeditor'
gem 'bootstrap-datepicker-rails', '~> 1.5'
gem 'select2-rails',          '~> 3.5.9.3'
gem 'devise_token_auth',      '~> 0.1.37'
gem 'omniauth',               '~> 1.3', '>= 1.3.1'
gem 'jquery-validation-rails'
gem 'will_paginate-bootstrap'
gem 'jquery-datatables-rails', '~> 3.4'
gem 'friendly_id',            '~> 5.1.0'
gem 'wicked_pdf',             '~> 1.0', '>= 1.0.6'
gem 'wkhtmltopdf-binary-edge', '~> 0.12.3.0'
gem 'browser',                '~> 2.1'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails',          '~> 3.4'
  gem 'factory_girl_rails',   '~> 4.5'
  gem 'launchy',              '~> 2.4', '>= 2.4.3'
  gem 'capybara',             '~> 2.5'
  gem 'poltergeist',          '~> 1.9.0'
end

group :staging, :demo, :production do
  gem 'asset_sync'
  gem 'newrelic_rpm'
  gem 'honeybadger',          '~> 2.0'
  gem 'airbrake',             '~>5.0'
end

group :development do
  gem 'rubocop',              require: false
  gem 'capistrano-rails',     '~> 1.1.1'
  gem 'capistrano-passenger', '~> 0.1.1'
  gem 'capistrano-rvm',       '~> 0.1.2'
  gem 'capistrano-sidekiq',   github: 'seuros/capistrano-sidekiq'
  gem 'capistrano-foreman'
end

group :test do
  gem 'database_cleaner',     '~> 1.5', '>= 1.5.1'
  gem 'guard-rspec',          '~> 4.6'
  gem 'json_spec',            '~> 1.1', '>= 1.1.4'
  gem 'shoulda-matchers'
  gem 'rspec-sidekiq'
  gem 'rspec-activemodel-mocks'
end
