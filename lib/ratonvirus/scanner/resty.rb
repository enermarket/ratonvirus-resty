require 'ratonvirus'

module Ratonvirus
  module Scanner
    class Resty < Ratonvirus::Scanner::Base
      class << self
        def executable?
          AntivirusCheckService.installed?
        end
      end

      protected

        def run_scan(path)
          if File.file?(path)
            result = AntivirusCheckService.new(path).call
            if result.virus?
              errors << :antivirus_virus_deteced
            end
          else
            errors << :antivirus_file_not_found
          end
          rescue StandardError
            errors << :antivirus_client_error
        end
    end
  end
end