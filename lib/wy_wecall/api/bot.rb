# frozen_string_literal: true

module WyWecall
  module Api
    module Bot
      # 功能说明：通过接口可以分页获取话术列表，包含意向标签和导入字段信息。
      def query_bot_list(page = 1, page_size = 10, bot_name = nil, status = nil)
        get('/bot/getBotList', { page: page, pageSize: page_size, botName: bot_name, status: status })
      end
    end
  end
end
