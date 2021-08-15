# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

# https://github.com/ruby-i18n/i18n#usage
gem 'i18n', '~> 1.8'
# https://github.com/fazibear/colorize#usage
gem 'colorize', '~> 0.8.1'
# https://github.com/rails/rails/tree/main/activemodel
gem 'activemodel', '~> 6.1', '>= 6.1.4'

group :development, :test do
  # https://github.com/pry/pry
  gem 'pry', '~> 0.14.1'
  # https://github.com/rubocop/rubocop#quickstart
  gem 'rubocop', require: false
  # https://github.com/rubocop/rubocop-rspec#usage
  gem 'rubocop-rspec', require: false
  # https://github.com/rubocop/rubocop-performance#usage
  gem 'rubocop-performance', require: false
  # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#setup
  gem 'factory_bot', '~> 6.2', require: false
end

group :test do
  # https://github.com/rspec/rspec#install
  gem 'rspec', '~> 3.10'
  # https://github.com/faker-ruby/faker#usage
  gem 'faker', '~> 2.18'
end
