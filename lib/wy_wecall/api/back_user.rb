# frozen_string_literal: true

module WyWecall
  module Api
    module BackUser
      # 功能说明：此接口可以查询当前存在的黑名单分组信息
      def query_black_user_group_list(page = 1, page_size = 10, group_name = nil)
        get('/blackUserGroup/list', { page: page, pageSize: page_size, groupName: group_name })
      end

      # 功能说明：通过此接口可以添加黑名单用户
      def add_black_user(group_id = nil, black_user_list = nil)
        post('/blackuser/add', { groupId: group_id, blackUserList: black_user_list })
      end

      # 功能说明：通过此接口可以删除黑名单用户
      def delete_black_user(group_id = nil, phone_list = nil)
        post('/blackuser/remove', { groupId: group_id, phoneList: phone_list })
      end

      # 功能说明：通过此接口可以查询黑名单用户
      def query_black_user_by_phone(group_id = nil, phone = nil)
        get('/blackuser/queryByPhone', { phone: phone, groupId: group_id })
      end
    end
  end
end
