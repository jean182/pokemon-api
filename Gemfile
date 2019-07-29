# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "active_model_serializers", "~> 0.10.0"
gem "bootsnap", ">= 1.1.0", require: false
gem "faker", git: "https://github.com/stympy/faker.git", branch: "master"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "rack-cors"
gem "rails", "~> 5.2.3"
gem "will_paginate", "~> 3.1.0"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 3.8"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop", "~> 0.73.0", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "shoulda-matchers"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
