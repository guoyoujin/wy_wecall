# frozen_string_literal: true

module WyWecall
  module Api
    module Sms
      # 功能说明： 通过此接口可以查询当前租户下的所有短信模版，包括未审核通过的。
      def query_sms_template_list(keyword = nil)
        get('/sms/getTemplateList', { keyword: keyword })
      end

      # 功能说明： 通过此接口可以查询当前租户下的已审核通过的短信模版列表
      def query_valid_sms_template_list(keyword = nil)
        get('/sms/getValidTemplateList', { keyword: keyword })
      end

      # 功能说明： 通过此接口可以查询当前租户下的所有短信发送记录。
      # 注意：默认查询最近1天的记录，查询范围：#{callTime}～请求时当前时间，callTime最大支持查询近7天的记录。
      # 查询条目上限为10000条。更多数据请对接短信发送结果回调。
      def query_sms_send_record_list(task_id = nil, call_time = nil, page = 1, page_size = 10)
        get('/sms/getSmsSendRecordList', { taskId: task_id, callTime: call_time, page: page, pageSize: page_size })
      end
    end
  end
end
