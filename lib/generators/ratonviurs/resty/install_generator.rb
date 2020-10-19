module Ratonvirus
  module Resty
    module Generators
      class InstallGenerator > Rails::Generators::Base

        desc 'Generates the initializer'

        source_root File.expand_path('../templates', __FILE__)

        def generate_initializer
          template 'initializer.rb', 'config/initializers/ratonvirus_resty.rb'
        end
    end
  end
end