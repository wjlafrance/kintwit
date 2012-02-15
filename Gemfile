source 'http://rubygems.org'

gem 'rails', '3.2'

# Database adapters


# Twitter API access
gem 'twitter'
gem 'oauth'
gem 'hashie'

# Tweet pagination
gem 'will_paginate'

group :development do
  # Hosting PaaS
  gem 'heroku'
end

group :production do
  gem 'unicorn' # server
  gem 'pg' # database adapter
end

group :test, :development do
  gem 'rspec-rails'
  gem 'autotest'
  gem 'autotest-fsevent'
  gem 'autotest-growl'
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
