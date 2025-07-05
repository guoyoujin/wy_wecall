# frozen_string_literal: true

module WyWecall
  module Api
    module LinePolicy
      # 功能说明：通过此接口可以查询智能外显策略列表，为分页查询，支持名称检索
      def query_line_policy_list(page = 1, page_size = 10, search_text = nil)
        get('/linePolicy/list', { page: page, pageSize: page_size, searchText: search_text })
      end
    end
  end
end
