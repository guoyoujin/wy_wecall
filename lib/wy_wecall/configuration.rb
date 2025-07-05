# frozen_string_literal: true

module WyWecall
  class Configuration
    DEFAULT_BASE_URL = 'https://b.163.com'
    DEFAULT_API_PATH = '/open/api/wecall'
    DEFAULT_API_VERSION = 'v1'
    DEFAULT_ALGORITHM = 'SHA256'
    attr_accessor :app_key, :app_secret, :app_type, :algorithm, :base_url,
                  :connection_adapter, :headers, :timeout, :open_timeout,
                  :api_path, :api_version, :debug_flag
  end
end
