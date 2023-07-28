module LevelTravelRails
  class << self
    attr_accessor :api_token, :error_load_path

    DEFAULT_TIMEOUT = 10
    DEFAULT_ERROR_LOAD_PATH = File.expand_path('../config/errors.yml')

    def config
      yield self
    end

    def api_token
      @api_token
    end

    def api_token=(token)
      @api_token = token
    end

    def error_load_path
      @error_load_path || DEFAULT_ERROR_LOAD_PATH
    end

    def error_load_path=(paths)
      @error_load_path = paths
    end

    def timeout
      @timeout || DEFAULT_TIMEOUT
    end

    def timeout=(seconds)
      @timeout = seconds
    end
  end
end

require 'oj'
require 'dry-validation'
require 'dry-types'
require 'dry-struct'

require 'level_travel_rails/types'
require 'level_travel_rails/request'
