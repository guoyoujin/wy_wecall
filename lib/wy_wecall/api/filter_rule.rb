# frozen_string_literal: true

module WyWecall
  module Api
    module FilterRule
      # 功能说明：通过接口可以分页获取拦截规则列表，包含规则id和规则名称及描述信息。
      def query_filter_rule_list(page = 1, page_size = 10, name = nil)
        get('/filterRule/list', { page: page, pageSize: page_size, name: name })
      end
    end
  end
end
