require "bundler/setup"
require "ratonvirus"
require "ratonvirus/resty"
require 'pry'
require 'vcr_setup'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end


require_relative "helpers"

Dir['./spec/support/**/*.rb'].map do |file|
  require file
end

RSpec.configure do |config|
  config.include Ratonvirus::Resty::Test::Helpers

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    Ratonvirus.reset
    Ratonvirus.configure do |rv_config|
      rv_config.storage = :filepath
      rv_config.addons = []
    end
  end
end
