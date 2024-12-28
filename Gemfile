source "https://rubygems.org"

ruby "3.3.6"

gem "rails", "~> 7.1.0"
gem "sprockets-rails"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug", platforms: %i[mri windows]
  gem "rspec-rails", "~> 5.0"
  gem "factory_bot_rails"
end

group :production do
  gem "pg"
  gem "redis", ">= 4.0.1"
  gem "kredis"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
