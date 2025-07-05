# frozen_string_literal: true

module WyWecall
  module Api
    module Wallet
      # 通过此接口可以查询已开通的租户的的当前钱包资源信息
      def query_wallet_info
        get('/wallet/getInfo')
      end

      # 通过此接口可以查询已开通的租户的短信资源信息
      def query_wallet_sms_info
        get('/wallet/getSmsInfo')
      end
    end
  end
end
