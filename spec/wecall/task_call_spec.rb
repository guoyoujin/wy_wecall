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
  context 'query_trask_call_un_call_list' do
    let(:response_body) { 
      {
          "requstId": "weqweqweqweqw-weqewe-1112e",
          "code": 200,
          "msg": "success",
          "data": {
            "page": 1,
            "pageSize": 10,
            "total": 2,
            "list": [
              {
                "callId": "uuid",
                "taskCallId": 52234456,
                "taskId": 43,
                "phone": "17751279857",
                "userName": "xxx",
                "importTime": 165119906255,
                "globalProperties": [
                    {
                        "name": "exId",
                        "value": "xxx"
                    }
                ],
                "importProperties":[{
                            "name":"家庭住址",
                            "valve":"xxxx"                      
                        },{
                            "name":"sex",
                            "valve":"男"                        
                }],
                "phoneType": 0,
                "recallNum": 0
              },
              {
                  "callId": "uuid",
                  "taskId": 43,
                  "phone": "17751279857",
                  "userName": "xxx",
                  "importTime": 165119906255,
                  "importProperties":[]
              }
          ]
        }
      }
    }

    let(:page) { 1 }
    let(:page_size) { 10 }
    let(:task_id) { 123456 }
    let(:user_name) { 'test' }
    let(:phone) { '13800138000' }
    let(:import_time) { '2021-01-01 00:00:00' }
    it 'should query_trask_call_un_call_list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/taskCall/unCallList', { taskId: task_id, page: page, pageSize: page_size, userName: user_name, phone: phone, importTime: import_time }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_trask_call_un_call_list(task_id, page, page_size, user_name, phone, import_time)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'delete_task_call' do
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
    let(:call_id) { '123456' }

    it 'should delete_task_call' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/taskCall/delete', { callId: call_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.delete_task_call(call_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_task_call_list' do
    let(:response_body) { 
      {
          "requstId": "weqweqweqweqw-weqewe-1112e",
          "code": 200,
          "msg": "success",
          "data": {
              "page": 1,
              "pageSize": 10,
              "total": 2,
              "list": [
                  {
                      "callId": "uuid",
                      "taskCallId": 52234456,
                      "taskId": 43,
                      "userName": "xxx",
                      "phone": "17751279857",
                      "replyStatus": "ANSWER",
                      "hangUpStatus": "DEFAULT",
                      "callUrl": "https://a3/RHGKTLBG_TaskId_1305203/ai_user.wav",
                      "importTime": 1651199067255,
                      "callTime": 1651199067255,
                      "callDuration": 37,
                      "ringDuration": 6,
                      "callRound": 2,
                      "userReplyTime":1651199067255,
                      "userHangUpTime":1651199067255,
                      "recallNum": 0,
                      "importProperties": [
                          {
                              "name": "生日",
                              "valve": "2019年10月1日"
                          }
                      ],
                      "dialogProperties": [
                          {
                              "name": "地址",
                              "value": "xxx"
                          },
                          {
                              "name": "性别",
                              "value": "女士"
                          }
                      ],
                      "globalProperties": [
                          {
                              "name": "exId",
                              "value": "xxx"
                          }
                      ],
                      "intentTagId": 2000,
                      "lineNumber": "053159519761"
                  },
                  {
                      "callId": "uuid",
                      "taskId": 43,
                      "userName": "xxx",
                      "phone": "17751279857",
                      "replyStatus": "ANSWER",
                      "hangUpStatus": "DEFAULT",
                      "callUrl": "https://a3/RHGKTLBG_TaskId_1305203/ai_user.wav",
                      "createTime": 1651199067255,
                      "callTime": 1651199067255,
                      "callDuration": 37,
                      "callRound": 2,
                      "importProperties": [
                          {
                              "name": "生日",
                              "valve": "2019年10月1日"
                          }
                      ],
                      "dialogProperties": [
                          {
                              "name": "地址",
                              "value": "xxx"
                          },
                          {
                              "name": "性别",
                              "value": "女士"
                          }
                      ],
                      "intentTagId": 2000,
                      "aiIntention":"A(意向较强)",
                      "lineNumber": "053159519761",
                      "oriCallId":"uuid",
                      "manual":true
                  }
              ]
          }
      }
    }
    let(:task_id) { 123456 }
    let(:page) { 1 }
    let(:page_size) { 10 }
    let(:user_name) { 'test' }
    let(:phone) { '13800138000' }
    let(:call_time) { '2021-01-01 00:00:00' }

    it 'should query_task_call_list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/taskCall/callList', { taskId: task_id, page: page, pageSize: page_size, userName: user_name, phone: phone, callTime: call_time }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_task_call_list(task_id, page, page_size, user_name, phone, call_time)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_filtered_call_list' do
    let(:response_body) { 
      {
          "requstId": "weqweqweqweqw-weqewe-1112e",
          "code": 200,
          "msg": "success",
          "data": {
              "page": 1,
              "pageSize": 10,
              "total": 2,
              "list": [
                  {
                      "callId": "uuid",
                      "taskCallId": 52234456,
                      "taskId": 43,
                      "userName": "xxx",
                      "phone": "17751279857",
                      "replyStatus": "ANSWER",
                      "hangUpStatus": "DEFAULT",
                      "callUrl": "https://a3/RHGKTLBG_TaskId_1305203/ai_user.wav",
                      "importTime": 1651199067255,
                      "callTime": 1651199067255,
                      "callDuration": 37,
                      "ringDuration": 6,
                      "callRound": 2,
                      "userReplyTime":1651199067255,
                      "userHangUpTime":1651199067255,
                      "recallNum": 0,
                      "importProperties": [
                          {
                              "name": "生日",
                              "valve": "2019年10月1日"
                          }
                      ],
                      "dialogProperties": [
                          {
                              "name": "地址",
                              "value": "xxx"
                          },
                          {
                              "name": "性别",
                              "value": "女士"
                          }
                      ],
                      "globalProperties": [
                          {
                              "name": "exId",
                              "value": "xxx"
                          }
                      ],
                      "intentTagId": 2000,
                      "lineNumber": "053159519761"
                  },
                  {
                      "callId": "uuid",
                      "taskId": 43,
                      "userName": "xxx",
                      "phone": "17751279857",
                      "replyStatus": "ANSWER",
                      "hangUpStatus": "DEFAULT",
                      "callUrl": "https://a3/RHGKTLBG_TaskId_1305203/ai_user.wav",
                      "createTime": 1651199067255,
                      "callTime": 1651199067255,
                      "callDuration": 37,
                      "callRound": 2,
                      "importProperties": [
                          {
                              "name": "生日",
                              "valve": "2019年10月1日"
                          }
                      ],
                      "dialogProperties": [
                          {
                              "name": "地址",
                              "value": "xxx"
                          },
                          {
                              "name": "性别",
                              "value": "女士"
                          }
                      ],
                      "intentTagId": 2000,
                      "aiIntention":"A(意向较强)",
                      "lineNumber": "053159519761",
                      "oriCallId":"uuid",
                      "manual":true
                  }
              ]
          }
      }
    }
    let(:task_id) { 123456 }
    let(:page) { 1 }
    let(:page_size) { 10 }
    let(:user_name) { 'test' }
    let(:phone) { '13800138000' }
    let(:call_time) { '2021-01-01 00:00:00' }

    it 'should query_filtered_call_list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/taskCall/filteredCallList', { taskId: task_id, page: page, pageSize: page_size, userName: user_name, phone: phone, callTime: call_time }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_filtered_call_list(task_id, page, page_size, user_name, phone, call_time)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_task_call_detail' do
    let(:response_body) { 
      {
          "requstId": "weqweqweqweqw-weqewe-1112e",
          "code": 200,
          "msg": "success",
          "data": {
              "page": 1,
              "pageSize": 10,
              "total": 2,
              "list": [
                  {
                      "callId": "uuid",
                      "taskCallId": 52234456,
                      "taskId": 43,
                      "userName": "xxx",
                      "phone": "17751279857",
                      "replyStatus": "ANSWER",
                      "hangUpStatus": "DEFAULT",
                      "callUrl": "https://a3/RHGKTLBG_TaskId_1305203/ai_user.wav",
                      "importTime": 1651199067255,
                      "callTime": 1651199067255,
                      "callDuration": 37,
                      "ringDuration": 6,
                      "callRound": 2,
                      "userReplyTime":1651199067255,
                      "userHangUpTime":1651199067255,
                      "recallNum": 0,
                      "importProperties": [
                          {
                              "name": "生日",
                              "valve": "2019年10月1日"
                          }
                      ],
                      "dialogProperties": [
                          {
                              "name": "地址",
                              "value": "xxx"
                          },
                          {
                              "name": "性别",
                              "value": "女士"
                          }
                      ],
                      "globalProperties": [
                          {
                              "name": "exId",
                              "value": "xxx"
                          }
                      ],
                      "intentTagId": 2000,
                      "lineNumber": "053159519761"
                  },
                  {
                      "callId": "uuid",
                      "taskId": 43,
                      "userName": "xxx",
                      "phone": "17751279857",
                      "replyStatus": "ANSWER",
                      "hangUpStatus": "DEFAULT",
                      "callUrl": "https://a3/RHGKTLBG_TaskId_1305203/ai_user.wav",
                      "createTime": 1651199067255,
                      "callTime": 1651199067255,
                      "callDuration": 37,
                      "callRound": 2,
                      "importProperties": [
                          {
                              "name": "生日",
                              "valve": "2019年10月1日"
                          }
                      ],
                      "dialogProperties": [
                          {
                              "name": "地址",
                              "value": "xxx"
                          },
                          {
                              "name": "性别",
                              "value": "女士"
                          }
                      ],
                      "intentTagId": 2000,
                      "aiIntention":"A(意向较强)",
                      "lineNumber": "053159519761",
                      "oriCallId":"uuid",
                      "manual":true
                  }
              ]
          }
      }
    }
    let(:call_id) { 123456 }

    it 'should query_task_call_detail' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/taskCall/detail', { callId: call_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_task_call_detail(call_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end
end
