# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module WyWecall
  module Api
    module HttpBase
      def post(url, body = {})
        conn.post(api_url(url), body) do |req|
          ts = current_timestamp
          req.headers['X-YS-APIKEY'] = app_key
          req.headers['X-YS-TIME'] = ts
          req.headers['X-YS-APPTYPE'] = app_type if app_type.present?
          req.headers['X-YS-SIGNATURE'] = build_body_signature(body, ts)
        end
      end

      def get(url, params = {})
        conn.get(api_url(url), params) do |req|
          ts = current_timestamp
          req.headers['X-YS-APIKEY'] = app_key
          req.headers['X-YS-TIME'] = ts
          req.headers['X-YS-APPTYPE'] = app_type if app_type.present?
          req.headers['X-YS-SIGNATURE'] = build_signature(params, ts)
        end
      end

      def api_url(url)
        "#{api_path}/#{api_version}#{url}"
      end

      def conn
        Faraday.new(url: base_url, headers: headers) do |faraday|
          faraday.options.timeout = timeout
          faraday.options.open_timeout = open_timeout
          faraday.request :json
          faraday.response :json
          faraday.response :raise_error
          faraday.response :logger
          faraday.adapter(connection_adapter)
        end
      end

      def current_timestamp
        Time.now.to_datetime.strftime('%Q')
      end
    end
  end
end
