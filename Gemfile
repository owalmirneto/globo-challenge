# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

# https://github.com/ruby-i18n/i18n#usage
gem 'i18n', '~> 1.8'

group :development, :test do
  # https://github.com/pry/pry
  gem 'pry', '~> 0.14.1'
  # https://github.com/rubocop/rubocop#quickstart
  gem 'rubocop', require: false
  # https://github.com/rubocop/rubocop-rspec#usage
  gem 'rubocop-rspec', require: false
  # https://github.com/rubocop/rubocop-performance#usage
  gem 'rubocop-performance', require: false
end

group :test do
  # https://github.com/rspec/rspec#install
  gem 'rspec', '~> 3.10'
end
