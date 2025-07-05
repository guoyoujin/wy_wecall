# frozen_string_literal: true

module WyWecall
  module Api
    module Account
      def query_account
        get('/account/get')
      end
    end
  end
end
