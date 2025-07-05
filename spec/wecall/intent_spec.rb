# frozen_string_literal: true

RSpec.describe WyWecall::Client do
  let(:app_key) { 'app_key' }
  let(:app_secret) { 'app_secret' }
  let(:app_type) { 'app_type' }
  let(:base_url) { 'https://b.163.com' }
  let(:debug_flag) { true }
  let(:algorithm) { 'SHA256' }
  let(:connection_adapter) { Faraday.default_adapter }
  let(:headers) { { 'Content-Type' => 'application/json' } }
  let(:timeout) { 10 }
  let(:open_timeout) { 10 }
  let(:api_path) { '/open/api/wecall' }
  let(:api_version) { 'v1' }
  let(:client) { WyWecall::Client.new(app_key: app_key, app_secret: app_secret, app_type: app_type, base_url: base_url, debug_flag: debug_flag, algorithm: algorithm, connection_adapter: connection_adapter, headers: headers, timeout: timeout, open_timeout: open_timeout, api_path: api_path, api_version: api_version) }
  let(:response_headers) { {
      "server" => "nginx",
      "date" => "Fri, 04 Jul 2025 14:21:48 GMT",
      "content-type" => "application/json;charset=UTF-8",
      "transfer-encoding" => "chunked",
      "connection" => "keep-alive",
      "vary" => "Accept-Encoding",
      "-tc" => "ys-wecall-openapi-console-docker-qiyu_gy_prod",
      "tid" => "d0bc45429e8047268ef88fdbd18abd59.4074.17516389088042137"
    } 
  }

  context 'query_intent_groups' do
    let(:response_body) { 
      {
        "requstId":"weqweqweqweqw-weqewe-1112e",
        "code":200,
        "msg":"success",
        "data":{
          "page": 1,
          "pageSize": 10,
          "total": 100,
          "list":[
            {
              "intentTagGroupId":112,
              "intentTagGroupName":"内置意向标签组",
              "intentTagType":"SYS",
              "used":1
            },
            {
              "intentTagGroupId":112,
              "intentTagGroupName":"内置意向标签组",
              "intentTagType":"CUSTOM",
              "used":1                      
            }
          ]
        }
      }
    }

    let(:page) { 1 }
    let(:page_size) { 10 }
    let(:name) { 'test' }
    it 'should intent groups' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/intent/getGroups', { page: page, pageSize: page_size, name: name }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_intent_groups(page, page_size, name)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_intent_groups_by_ids' do
    let(:response_body) { 
      {
        "requstId": "weqweqweqweqw-weqewe-1112e",
        "code": 200,
        "msg": "success",
        "data": [
          {
            "intentTagGroupId": 112,
            "intentTagGroupName": "内置意向标签组",
            "intentTagType": "SYS",
            "used": 1,
            "intentTagList": [
              {
                "intentTagId": 1000,
                "intentTagGrade": "A",
                "intentTagGradeDesc": "等级描述A"
              },
              {
                "intentTagId": 1001,
                "intentTagGrade": "B",
                "intentTagGradeDesc": "等级描述B"
              }
            ]
          },
          {
            "intentTagGroupId": 112,
            "intentTagGroupName": "内置意向标签组",
            "intentTagType": "CUSTOM",
            "used": 1,
            "intentTagList": [
              {
                "intentTagId": 1003,
                "intentTagGrade": "A",
                "intentTagGradeDesc": "等级描述A"
              },
              {
                "intentTagId": 1004,
                "intentTagGrade": "B",
                "intentTagGradeDesc": "等级描述B"
              }
            ]
          }
        ]
      }
    }

    let(:id_list) { '1,2,3' }
    it 'should intent groups by ids' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/intent/getGroupsByIds', { idList: id_list }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_intent_groups_by_ids(id_list)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_intent_group_detail' do
    let(:response_body) { 
      {
        "requstId":"weqweqweqweqw-weqewe-1112e",
        "code":200,
        "msg":"success",
        "data":{
          "intentTagGroupId":112,
          "intentTagGroupName":"内置意向标签组",
          "intentTagType":"SYS",
          "used":1,
          "intentTagList":[
            {
                "intentTagId":1000,
                "intentTagGrade":"A",
                "intentTagGradeDesc":"等级描述A"                                        
            },{
                "intentTagId":1001,
                "intentTagGrade":"B",
                "intentTagGradeDesc":"等级描述B"          
            }
          ]
        }
      }
    }

    let(:intent_tag_group_id) { 112 }
    it 'should  by intent_tag_group_id' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/intent/getGroupDetail', { intentTagGroupId: intent_tag_group_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_intent_group_detail(intent_tag_group_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'create_intent' do
    let(:response_body) { 
      {
        "requstId":"weqweqweqweqw-weqewe-1112e",
        "code":200,
        "msg":"success",
        "data":{
          "intentTagGroupId":112,
          "intentTagGroupName":"内置意向标签组",
          "intentTagType":"SYS",
          "used":1,
          "intentTagList":[
            {
              "intentTagId":1000,
              "intentTagGrade":"A",
              "intentTagGradeDesc":"等级描述A"                                        
            },{
              "intentTagId":1001,
              "intentTagGrade":"B",
              "intentTagGradeDesc":"等级描述B"          
            }
          ]
        }
      }
    }
    let(:name) { 'test' }
    let(:description) { 'test' }  
    let(:intent_tag_grade) { 'A' }
    let(:intent_tag_grade_desc) { 'test' }
    it 'should  by intent_tag_group_id' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/intent/create', { intentTagGroupName: name, intentTagList: description, intentTagGrade: intent_tag_grade, intentTagGradeDesc: intent_tag_grade_desc }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.create_intent(name, description, intent_tag_grade, intent_tag_grade_desc)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'update_intent' do
    let(:response_body) { 
      {
        "requstId":"weqweqweqweqw-weqewe-1112e",
        "code":200,
        "msg":"success",
        "data":{
          "intentTagGroupId":112,
          "intentTagGroupName":"内置意向标签组",
          "intentTagType":"SYS",
          "used":1,
          "intentTagList":[
            {
              "intentTagId":1000,
              "intentTagGrade":"A",
              "intentTagGradeDesc":"等级描述A"                                        
            },{
              "intentTagId":1001,
              "intentTagGrade":"B",
              "intentTagGradeDesc":"等级描述B"          
            }
          ]
        }
      }
    }
    let(:intent_tag_group_id) { 112 }
    let(:name) { 'test' }
    let(:description) { 'test' }  
    let(:intent_tag_grade) { 'A' }
    let(:intent_tag_grade_desc) { 'test' }
    it 'should  by update_intent' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/intent/update', { intentTagGroupId: intent_tag_group_id, intentTagGroupName: name, intentTagList: description, intentTagGrade: intent_tag_grade, intentTagGradeDesc: intent_tag_grade_desc }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.update_intent(intent_tag_group_id, name, description, intent_tag_grade, intent_tag_grade_desc)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end
  context 'delete_intent' do
    let(:response_body) { 
      {
        "requestId": "RKXNIQAFwr213123dad",
        "code": 200,  
        "msg": "success",  
        "data": {
            "success":true  
        }
      }
    }
    let(:intent_tag_group_id) { 112 }
    it 'should  by delete_intent' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/intent/delete', { intentTagGroupId: intent_tag_group_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.delete_intent(intent_tag_group_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end
end
