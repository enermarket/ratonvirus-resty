require "bundler/setup"
require "ratonvirus/resty"
require 'pry'
require 'webmock/rspec'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

Dir['./spec/support/**/*.rb'].map do |file|
  require file
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
