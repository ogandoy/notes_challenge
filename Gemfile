source "https://rubygems.org"

ruby "3.2.6"
gem "rails", "~> 7.1.0"

# The original asset pipeline for Rails
gem "sprockets-rails"

# Database
gem "pg", "~> 1.1"

# App server
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps
gem "importmap-rails"

# Hotwire's SPA-like page accelerator
gem "turbo-rails"

# Hotwire's modest JavaScript framework
gem "stimulus-rails"

# Build JSON APIs with ease
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Views and Templates
gem "haml-rails", "~> 2.0"
gem 'html2haml', '~> 2.3'

# Authentication and Authorization
gem "devise", "~> 4.9"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails", "~> 6.0"
  gem 'cypress-rails', '~> 0.7.1'
end


group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'rubocop', '~> 1.60', require: false
  gem 'rubocop-rails', '~> 2.20', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
end
