# frozen_string_literal: true

module WyWecall
  class Client
    include Api::HttpBase
    include Api::Account
    include Api::BackUser
    include Api::Bot
    include Api::FilterRule
    include Api::Intent
    include Api::Line
    include Api::LinePolicy
    include Api::Order
    include Api::Seat
    include Api::Sms
    include Api::Task
    include Api::TaskCall
    include Api::Wallet
    include Api::Sign

    attr_accessor :app_key, :app_secret, :app_type, :algorithm, :base_url,
                  :connection_adapter, :headers, :timeout, :open_timeout,
                  :api_path, :api_version, :debug_flag

    def initialize(options = {})
      @app_key            = options[:app_key] || WyWecall.configuration.app_key
      @app_secret         = options[:app_secret] || WyWecall.configuration.app_secret
      @app_type           = options[:app_type]  || WyWecall.configuration.app_type
      @algorithm          = options[:algorithm] || WyWecall.configuration.algorithm
      @headers            = options[:headers] || WyWecall.configuration.headers
      @base_url           = options[:base_url] || WyWecall.configuration.base_url || WyWecall::Configuration::DEFAULT_BASE_URL
      @connection_adapter = options[:connection_adapter] || WyWecall.configuration.connection_adapter
      @timeout            = options[:timeout] || WyWecall.configuration.timeout
      @open_timeout       = options[:open_timeout] || WyWecall.configuration.open_timeout
      @api_path           = options[:api_path] || WyWecall.configuration.api_path || WyWecall::Configuration::DEFAULT_API_PATH
      @api_version        = options[:api_version] || WyWecall.configuration.api_version || WyWecall::Configuration::DEFAULT_API_VERSION
      @debug_flag         = options[:debug_flag] || WyWecall.configuration.debug_flag
    end

    def log_debug(message)
      return unless @debug_flag

      puts message
    end
  end
end
