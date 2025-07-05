# frozen_string_literal: true

module WyWecall
  module Api
    module TaskCall
      # 功能说明：通过此接口可以获取未呼的通话记录。
      # 注意：默认查询最近1天的记录，查询范围：#{callTime}～请求时当前时间，callTime最大支持查询近7天的记录。
      #     查询条目上限为10000条。更多数据请对接通话完成回调接口。
      def query_trask_call_un_call_list(task_id = nil, page = 1, page_size = 10, user_name = nil, phone = nil, import_time = nil)
        get('/taskCall/unCallList', { taskId: task_id, page: page, pageSize: page_size, userName: user_name, phone: phone, importTime: import_time })
      end

      # 功能说明： 通过此接口删除未呼的通话记录
      def delete_task_call(call_id = nil)
        post('/taskCall/delete', { callId: call_id })
      end

      # 功能说明： 通过此接口可以获取已呼的通话记录
      # 注意：默认查询最近1天的记录，查询范围：#{callTime}～请求时当前时间，callTime最大支持查询近7天的记录。
      # 查询条目上限为10000条。更多数据请对接已呼通话记录回调
      def query_task_call_list(task_id = nil, page = 1, page_size = 10, user_name = nil, phone = nil, call_time = nil)
        get('/taskCall/callList', { taskId: task_id, page: page, pageSize: page_size, userName: user_name, phone: phone, callTime: call_time })
      end

      # 功能说明： 通通过此接口可以获取拦截的通话记录
      # 注意：默认查询最近1天的记录，查询范围：#{callTime}～请求时当前时间，callTime最大支持查询近7天的记录。
      # 查询条目上限为10000条。更多数据请对接已呼通话记录回调
      def query_filtered_call_list(task_id = nil, page = 1, page_size = 10, user_name = nil, phone = nil, call_time = nil)
        get('/taskCall/filteredCallList', { taskId: task_id, page: page, pageSize: page_size, userName: user_name, phone: phone, callTime: call_time })
      end

      # 功能说明： 通通过此接口可以获取拦截的通话记录
      # 注意：默认查询最近1天的记录，查询范围：#{callTime}～请求时当前时间，callTime最大支持查询近7天的记录。
      # 查询条目上限为10000条。更多数据请对接已呼通话记录回调
      def query_task_call_detail(call_id = nil)
        get('/taskCall/detail', { callId: call_id })
      end
    end
  end
end
