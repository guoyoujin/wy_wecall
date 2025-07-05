# frozen_string_literal: true

require 'wy_wecall/version'
require 'wy_wecall/configuration'
require 'wy_wecall/api'
require 'wy_wecall/client'

module WyWecall
  class << self
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
