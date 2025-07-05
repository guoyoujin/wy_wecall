# frozen_string_literal: true

module WyWecall
  module Api
    module Task
      # 功能说明：通过接口可以分页获取任务列表，包含任务id、任务名称、任务状态、创建时间、更新时间。
      def import_customer(task_id = nil, customer_list = [], remove_repeat = false, encrypted_phone = false, on_call = false)
        post('/task/importCustomer', { taskId: task_id, customerList: customer_list, removeRepeat: remove_repeat, encryptedPhone: encrypted_phone, onCall: on_call })
      end

      # 通过此接口可以向指定的任务导入客户信息，用于拨打电话。（单次导入客户数量不能大于100）
      # 此接口是公网服务，所有客户共用，为保证接口响应速度和吞吐量，并控制服务器压力，将单次导入个数定位100个。
      # 数据量大时可以重复调用此接口来实现（qps最大可为1000）。
      # 导入的客户，如果部分成功，部分失败的话，会返回200。
      # 该接口会返回所有导入成功和导入失败的客户列表，成功的客户列表中包含callId，可用于后续查询该通话的详情信息。
      # 支持用户手机号MD5导入和aes加密后导入。加密配置参考加密配置。接口对接参考敏感字段加密。
      def import_customer_with_result(task_id = nil, customer_list = [], remove_repeat = false, encrypted_phone = false, on_call = false)
        post('/task/importCustomerWhitResult', { taskId: task_id, customerList: customer_list, removeRepeat: remove_repeat, encryptedPhone: encrypted_phone, onCall: on_call })
      end

      # 通过此接口可以创建或者更新一个外呼任务。更新任务时，需要指定任务id。
      # 注意：单个apiKey可创建的任务上限为50000（已被删除的任务不参与统计，即删除任务可以释放可创建任务额度）
      def save_task(body = {})
        post('/task/save', body)
      end

      # 通过此接口可以删除指定的任务。
      def delete_task(task_id = nil)
        post('/task/delete', { taskId: task_id })
      end

      # 通过此接口可以开启指定的外呼任务
      def start_task(task_id = nil)
        post('/task/start', { taskId: task_id })
      end

      # 通过此接口可以停止正在进行的任务
      def stop_task(task_id = nil)
        post('/task/stop', { taskId: task_id })
      end

      # 通过此接口可以开启指定的外呼任务定时，开启任务定时后，任务进入定时状态，在满足运行条件后，自动运行，不需要再手动调用开启任务
      def start_timing_task(task_id = nil)
        post('/task/startTiming', { taskId: task_id})
      end

      # 通过此接口可以停止外呼任务的定时，任务进入待运行状态
      def stop_timing_task(task_id = nil)
        post('/task/stopTiming', { taskId: task_id })
      end

      # 功能说明： 通过此接口可以获取租户的任务列表
      def query_task_list(name = nil, status=nil, page = 1, page_size = 10, create_start = nil, create_end = nil)
        params = {
          name: name,
          status: status,
          page: page,
          pageSize: page_size,
          createStart: create_start,
          createEnd: create_end
        }
        get('/task/getTaskList', params)
      end

      # 功能说明： 通过此接口可以获取租户的任务详情
      def query_task_detail(task_id = nil)
        get('/task/getTaskDetail', { taskId: task_id })
      end

      # 功能说明： 通过此接口指定任务的详情
      def query_task_properties(task_id = nil)
        get('/task/getTaskProperties', { taskId: task_id })
      end

      # 功能说明： 通过此接口获取当前租户任务统计
      def query_task_summary
        get('/task/taskSummary')
      end

      # 功能说明： 通过此接口获取当前租户文件信息
      def query_console_folder_list
        get('/console/folder/list')
      end
    end
  end
end
