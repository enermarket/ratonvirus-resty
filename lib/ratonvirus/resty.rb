require 'faraday'
require 'mimemagic'
require 'active_support'
require 'rails'
require 'ratonvirus/resty/version'
require 'ratonvirus/scanner/resty'
require 'ratonvirus/resty/configuration'
require 'ratonvirus/services/antivirus_check_service'
require 'ratonvirus/resty/engine' if defined?("Rails")

module Ratonvirus
  module Resty
    extend Configuration

    class Error < StandardError; end
  end
end
