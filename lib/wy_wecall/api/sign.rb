# frozen_string_literal: true

module WyWecall
  module Api
    module Sign
      def build_signature(params, body, timestamp, algorithm, app_secret)
        log_debug("Wecall signature params: #{params}, body: #{body}, timestamp: #{timestamp}")
        message = "#{timestamp}#{params.sort.to_h.values.compact.join}#{body.sort.to_h.values.compact.join}"
        log_debug("Wecall signature message: #{message}, algorithm: #{algorithm}, app_secret: #{app_secret}")
        signature = OpenSSL::HMAC.hexdigest(algorithm, app_secret, message)
        log_debug("Wecall signature result: #{signature}")
        signature
      end
    end
  end 
end
