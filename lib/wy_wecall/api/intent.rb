# frozen_string_literal: true

module WyWecall
  module Api
    module Intent
      # 功能说明：提供给业务方查询意向标签组列表
      def query_intent_groups(page = 1, page_size = 10, name = nil)
        get('/intent/getGroups', { page: page, pageSize: page_size, name: name })
      end

      # 功能说明：提供给业务方查询意向标签组列表
      def query_intent_groups_by_ids(id_list = nil)
        get('/intent/getGroupsByIds', { idList: id_list })
      end

      # 功能说明：提供给业务方查询某个意向标签组的意向标签列表
      def query_intent_group_detail(intent_tag_group_id = nil)
        get('/intent/getGroupDetail', { intentTagGroupId: intent_tag_group_id })
      end

      # 功能说明：提供给业务方创建意向标签组
      def create_intent(name = nil, description = nil, intent_tag_grade = nil, intent_tag_grade_desc = nil)
        post('/intent/create', { intentTagGroupName: name, intentTagList: description, intentTagGrade: intent_tag_grade, intentTagGradeDesc: intent_tag_grade_desc })
      end

      # 功能说明：提供给业务方更新某个标签组的标签
      def update_intent(intent_tag_group_id = nil, name = nil, description = nil, intent_tag_grade = nil, intent_tag_grade_desc = nil)
        post('/intent/update', { intentTagGroupId: intent_tag_group_id, intentTagGroupName: name, intentTagList: description, intentTagGrade: intent_tag_grade, intentTagGradeDesc: intent_tag_grade_desc })
      end

      # 功能说明：删除某个未被外呼任务使用过的意向标签组
      # 系统内置的标签组不可删除
      def delete_intent(intent_tag_group_id = nil)
        post('/intent/delete', { intentTagGroupId: intent_tag_group_id })
      end
    end
  end
end
