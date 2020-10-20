require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ratonvirus
  module Resty
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:service_url) { ENV.fetch('RESTY_SERVICE_URL', 'http://localhost:9000/scan') }
      mattr_accessor(:username) { ENV.fetch('RESTY_USERNAME', nil) }
      mattr_accessor(:password) { ENV.fetch('RESTY_PASSWORD', nil) }
      mattr_accessor(:proxy_url) { ENV.fetch('PROXY_URL') { nil } }
    end
  end
end