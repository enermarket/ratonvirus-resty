require 'spec_helper'
require 'generator_spec'
require 'generators/ratonvirus/resty/install_generator'

RSpec.describe Ratonvirus::Resty::Generators::InstallGenerator, type: :generator do
  destination File.expand_path("../../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "creates a test initializer" do
    assert_file "config/initializers/ratonvirus-resty.rb", /Ratonvirus::Resty.configure/
  end

end