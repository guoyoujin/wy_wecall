# frozen_string_literal: true

module WyWecall
  module Api
    module Order
      # 功能说明：通过此接口可以获取租户消耗类订单列表
      # 注意：消耗类订单，大并发呼叫情况下，剩余金额存在一定的延迟，实时数据请以钱包剩余金额为准
      def query_call_order_list(page = 1, page_size = 10)
        get('/wallet/order/getCallOrder', { page: page, pageSize: page_size })
      end

      # 功能说明：通过此接口可以获取租户短信类订单列表
      def query_sms_order_list(page = 1, page_size = 10)
        get('/wallet/order/getSmsOrder', { page: page, pageSize: page_size })
      end
    end
  end
end
