# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt"
gem "bootstrap", "~>4.0.0.beta2.1"
gem "coffee-rails", "~> 4.2"
gem "font-awesome-rails"
gem "haml"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "json"
gem "kaminari"
gem "loofah", ">=2.2.1"
gem "mysql2"
gem "pry-rails"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"
gem "roo"
gem "roo-xls"
gem "sass-rails", "~> 5.0"
gem "sidekiq"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "annotate"
  gem "haml-lint"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
