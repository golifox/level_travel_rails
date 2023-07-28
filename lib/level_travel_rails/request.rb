# frozen_string_literal: true

require 'faraday'
require 'oj'

module LevelTravelRails
  # The Request class provides methods for making HTTP requests to the Level.Travel API.
  class Request
    HOST = 'https://api.level.travel'

    # Represents the response received from the Level.Travel API.
    class Response < Dry::Struct
      attribute :code, ::LevelTravelRails::Types::Strict::Integer
      attribute :error, ::LevelTravelRails::Types::Strict::String.optional
      attribute :body, ::LevelTravelRails::Types::Strict::Hash

      # Checks if the request was successful.
      #
      # @return [Boolean] true if the response has a success status code (200), false otherwise.
      def success?
        code == 200
      end

      # Checks if the request encountered an error.
      #
      # @return [Boolean] true if the response has a non-success status code, false otherwise.
      def failure?
        !success?
      end
    end

    # Performs a GET request to the Level.Travel API.
    #
    # @param url [String] The URL of the API endpoint.
    # @param params [Hash] Additional query parameters for the request.
    # @return [LevelTravelRails::Request::Response] The response received from the API.
    def self.get(url, params = {})
      response = request_client.get(url) do |request|
        request.params = params
        request.options.timeout = LevelTravelRails.timeout
      end

      return_parsed response
    end

    # Performs a POST request to the Level.Travel API.
    #
    # @param url [String] The URL of the API endpoint.
    # @param payload [Hash] Payload data for request.
    # @return [LevelTravelRails::Request::Response] The response received from the API.
    def self.post(url, payload = {})
      response = request_client.post(url) do |request|
        request.body = payload
        request.options.timeout = LevelTravelRails.timeout
      end

      return_parsed response
    end

    def self.return_parsed(response)
      body = Oj.load(response.body, symbol_keys: true, mode: :compat)
      Response.new(code: response.status, error: body[:error], body: body)
    end

    # Returns the headers for the API request.
    #
    # @return [Hash] The headers to be included in the request.
    def self.headers
      {
        Accept: 'application/vnd.leveltravel.v3',
        Authorization: format('Token token="%<api_token>s"', api_token: LevelTravelRails.api_token)
      }
    end

    # Returns a Faraday HTTP client configured with the specified URL and headers.
    #
    # @return [Faraday::Connection] The configured Faraday HTTP client.
    def self.request_client
      Faraday.new(url: HOST, headers: headers)
    end

  end
end
