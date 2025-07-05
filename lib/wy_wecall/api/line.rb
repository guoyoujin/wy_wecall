# frozen_string_literal: true

module WyWecall
  module Api
    module Line
      # 通过此接口可以查询已开通的租户的可用线路列表
      def query_active_lines(page = 1, page_size = 10)
        get('/line/getActiveLines', { page: page, pageSize: page_size })
      end
    end
  end
end
