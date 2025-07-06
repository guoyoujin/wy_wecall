# frozen_string_literal: true

require 'faraday'

module WyWecall
  module Api
    module HttpBase
      def post(url, body = {})
        conn.post(api_url(url), body) do |req|
          ts = Time.now.utc.to_i.to_s
          req.headers['X-YS-APIKEY'] = app_key
          req.headers['X-YS-TIME'] = ts
          req.headers['X-YS-APPTYPE'] = app_type
          req.headers['X-YS-TIMX-YS-SIGNATURE'] = build_signature(body, ts)
        end
      end

      def get(url, params = {})
        conn.get(api_url(url), params) do |req|
          ts = Time.now.utc.to_i.to_s
          req.headers['X-YS-APIKEY'] = app_key
          req.headers['X-YS-TIME'] = ts
          req.headers['X-YS-APPTYPE'] = app_type
          req.headers['X-YS-TIMX-YS-SIGNATURE'] = build_signature(params, ts)
        end
      end

      def api_url(url)
        "#{api_path}/#{api_version}#{url}"
      end

      def conn
        Faraday.new(url: base_url, headers: headers) do |faraday|
          faraday.options.timeout = timeout
          faraday.options.open_timeout = open_timeout
          faraday.adapter(connection_adapter)
        end
      end
    end
  end
end
