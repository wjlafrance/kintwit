source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Twitter API access
gem 'twitter', '~> 2.1'
gem 'oauth'
gem 'hashie'

# Tweet pagination
gem 'will_paginate'

group :development do
  gem 'heroku'       # hosting platform
  gem 'autotest'
end

group :production do
  gem 'unicorn'      # server
  gem 'pg'           # database adapter
  gem 'newrelic_rpm' # performance monitor
end

group :test, :development do
  gem 'rspec-rails'
  gem 'simplecov' # test coverage meter
  gem 'timecop'
  gem 'sqlite3' # database adapter
end

group :test do
  gem 'factory_girl_rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier',     '>= 1.2.2'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
