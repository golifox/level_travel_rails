require 'rspec'
require 'bundler/setup'
require 'level_travel_rails'
require 'webmock/rspec'
require 'dotenv/load'

if ENV['WITH_COVERAGE']
  require 'simplecov'

  SimpleCov.start do
    add_filter 'spec/*'
    add_filter '.github/'
    add_filter 'lib/level_travel_rails/version'
  end
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random
end
