# frozen_string_literal: true

module WyWecall
  module Api
    module Sign
      def build_signature(params, timestamp)
        log_debug("Wecall signature params: #{params}, timestamp: #{timestamp}")
        message = "#{timestamp}#{params.sort.to_h.values.compact.join}"
        log_debug("Wecall signature message: #{message}, algorithm: #{algorithm}, app_secret: #{app_secret}")
        signature = OpenSSL::HMAC.hexdigest(algorithm, app_secret, message)
        log_debug("Wecall signature result: #{signature}")
        signature
      end

      def build_body_signature(body, timestamp)
        log_debug("Wecall signature body: #{body}, timestamp: #{timestamp}")
        message = "#{timestamp}#{body.to_json}"
        log_debug("Wecall signature message: #{message}, algorithm: #{algorithm}, app_secret: #{app_secret}")
        signature = OpenSSL::HMAC.hexdigest(algorithm, app_secret, message)
        log_debug("Wecall signature result: #{signature}")
        signature
      end
    end
  end
end
