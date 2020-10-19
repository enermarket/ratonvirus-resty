module Ratonvirus
  class AntivirusCheckService
    class Result
      attr_accessor :parsed_response

      def virus?
        parsed_response.any? && parsed_response['status'] != 'OK'
      end
    end

    attr_accessor :file_path, :result

    def initialize(path)
      @file_path = path

      @logger = Logger.new(STDOUT)
      @result = Result.new
    end

    def installed?
      true
    end

    def call
      perform_request
      @result
    end

    private

    def perform_request
      @logger.debug { "Performing request to #{base_url}" }
      begin
        @response = connection.post(base_url, { file: initialize_upload_file })
        @result.parsed_response = parse_response
        unless @response.success?
          @logger.debug { "API request respond with status code #{@response.status}: #{parse_response}"}
        end
      rescue => exception
        @logger.debug { "There was an error performing the API request: #{exception.message}"}
      end
    end

    def parse_response
      @logger.debug { "Parsing response #{@response}"}
      JSON.parse(@response.body).transform_keys(&:downcase)
    end

    def connection
      @connection ||= initialize_connection
    end

    def request_headers
      { 'Content-Type' => 'application/json;charset=UTF-8' }
    end

    def initialize_connection
      Faraday.new(base_url, proxy: proxy) do |f|
        f.request :url_encoded
        f.request :multipart
        f.request :basic_auth, Ratonvirus::Resty::Configuration.username, Ratonvirus::Resty::Configuration.password if request_use_basic_auth?
        f.adapter :net_http
      end
    end

    def initialize_upload_file
      Faraday::UploadIO.new(file_path, mime_type)
    end

    def mime_type
      MimeMagic.by_path(file_path)
    end

    def base_url
      Ratonvirus::Resty::Configuration.service_url
    end

    def request_path
      "#{base_url}"
    end

    def request_use_basic_auth?
      Ratonvirus::Resty::Configuration.username && Ratonvirus::Resty::Configuration.password
    end

    def proxy
      Ratonvirus::Resty::Configuration.proxy_url
    end
  end
end