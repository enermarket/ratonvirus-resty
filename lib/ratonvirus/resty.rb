require "ratonvirus/resty/version"
require "ratonvirus/resty/configuration"
require "faraday"
require "mimemagic"
require 'active_support'

require_relative "scanner/resty"
require_relative "resty/configuration"

module Ratonvirus
  autoload :AntivirusCheckService, 'ratonvirus/services/antivirus_check_service'
  
  module Resty
    extend Configuration
    class Error < StandardError; end
  end
end
