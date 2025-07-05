# frozen_string_literal: true

module WyWecall
  module Api
    module Seat
      # 通过此接口可以查询当前租户坐席使用情况
      def query_seat_info
        get('/seat/getCurrentSeatInfo')
      end

      # 通过此接口可以查询已开通坐席版的租户购买的坐席明细
      # 如购买智能外呼套餐是消耗版时，该接口坐席情况返回为空
      def query_seat_details(page = 1, page_size = 10)
        get('/seat/getDetails', { page: page, pageSize: page_size })
      end
    end
  end
end
