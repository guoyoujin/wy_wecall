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
  context 'import_customer' do
    let(:response_body) { 
      {
        "requestId": "RKXNIQAFwr213123dad",
        "code": 200,  
        "msg": "成功",  
        "data": [
              {
                "phone": "18283748928",         
                "errorMsg": "手机号重复"
              },
              {
                "phone": "18283748928",
                "errorMsg": "手机号重复"
              }
          ] 
      }
    }
    let(:task_id) { 123456 }
    let(:remove_repeat) { false }
    let(:encrypted_phone) { false }
    let(:on_call) { false }
    let(:customer_list) { [{ name: 'test', phone: '11111111111', gender: 'MALE', properties: { '年龄': '数字类型，如 20', '日期类型': 'yyyy-MM-dd格式，如2023-06-15', '时间类型': 'HH:mm:ss格式，如12:45:00', '文本类型': '字符串，如xxxx' }, globalProperties: { 'exId': 'xxxx' } }] }
    it 'should query_trask_call_un_call_list' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/importCustomer', { taskId: task_id, customerList: customer_list, removeRepeat: remove_repeat, encryptedPhone: encrypted_phone, onCall: on_call }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.import_customer(task_id, customer_list, remove_repeat, encrypted_phone, on_call)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'import_customer_with_result' do
    let(:response_body) { 
      {
        "requestId": "RKXNIQAFwr213123dad",
        "code": 200,
        "msg": "成功",
        "data": {
          "successList": [
            {
              "phone": "18283748928",
              "callId": "f0406b9a64cc49dbab939a82e2edb385"
            },
            {
              "phone": "18283748928",
              "callId": "08a842128a3241da82676657df93d01e"
            }
          ],
          "failList": [
            {
              "phone": "18283748928",
              "errorMsg": "手机号重复"
            },
            {
              "phone": "18283748928",
              "errorMsg": "手机号重复"
            }
          ]
        }
      }
    }
    let(:task_id) { 123456 }
    let(:remove_repeat) { false }
    let(:encrypted_phone) { false }
    let(:on_call) { false }
    let(:customer_list) { [{ name: 'test', phone: '11111111111', gender: 'MALE', properties: { '年龄': '数字类型，如 20', '日期类型': 'yyyy-MM-dd格式，如2023-06-15', '时间类型': 'HH:mm:ss格式，如12:45:00', '文本类型': '字符串，如xxxx' }, globalProperties: { 'exId': 'xxxx' } }] }
    it 'should import_customer_with_result' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/importCustomerWhitResult', { taskId: task_id, customerList: customer_list, removeRepeat: remove_repeat, encryptedPhone: encrypted_phone, onCall: on_call }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.import_customer_with_result(task_id, customer_list, remove_repeat, encrypted_phone, on_call)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'save_task' do
    let(:response_body) { 
      {
        "requestId": "RKXNIQAFwr213123dad",
        "code": 200,  
        "msg": "success",  
        "data": {
            "taskId":123  
        }
      }
    }
    let(:body) { 
      {
        "taskName": "123",
        "botId": 123,
        "blacklistGroups": [{
          "id": 123
        }, {
          "id": 456
        }],
        "didNumbers": [
          "11111",
          "22222",
          "33333"
        ],
        "robotSeat": 5,
        "recall": 1,
        "recallConf": {
          "interval": 10,
          "count": 10,
          "condition": {
            "replyStatusList": [
              "CLOSE",
              "NO_REPLY"
            ],
            "intentTagIdList": [
              111,
              222
            ]
          }
        },
        "lineType": 1,
        "linePolicyId": 1001,
        "filterConf": {
          "filterRuleId": 111
        }
      }

     }
    it 'should save_task' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/save', body).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.save_task(body)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'delete_task' do
    let(:response_body) { 
      {
        "requestId": "RKXNIQAFwr213123dad",
        "code": 200,  
        "msg": "success",  
        "data": {
            "taskId":123  
        }
      }
    }
    let(:task_id) { 123456 }
    it 'should delete_task' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/delete', { taskId: task_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.delete_task(task_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'start_task' do
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
    let(:task_id) { 123456 }
    it 'should start_task' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/start', { taskId: task_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.start_task(task_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'stop_task' do
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
    let(:task_id) { 123456 }
    it 'should stop_task' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/stop', { taskId: task_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.stop_task(task_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'start_timing_task' do
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
    let(:task_id) { 123456 }
    it 'should start_timing_task' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/startTiming', { taskId: task_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.start_timing_task(task_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'stop_timing_task' do
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
    let(:task_id) { 123456 }
    it 'should stop_timing_task' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/task/stopTiming', { taskId: task_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.stop_timing_task(task_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_task_list' do
    let(:response_body) { 
      {
        "requestId": "5B0F201FDCDA45C2AA921AE177F94991",
        "code": 200,
        "msg": "success",
        "data": {
            "page": 1,
            "pageSize": 10,
            "total": 2,
            "list": [
                {
                    "taskId": 100,
                    "taskName": "测试任务名称one",
                    "status": "RUNNING",
                    "robotSeat":1,
                    "stopType":1,
                    "stopTime":1651199249000,
                    "createTime": "2020-09-28 15:15:14",
                    "taskStats": {
                        "importTaskCallNum": 123,
                        "callNum": 123,
                        "filteredNum": 123,
                        "unCallNum": 123,
                        "distinctUser": 123,
                        "distinctUserReply": 123,
                        "hangupNum": 123,
                        "distinctUserHighIntention": 123,
                        "callMinuteUsage": 123,
                        "callCntUsage": 123,
                        "callSmsUsage": 123,
                        "avgCallTime": 123,
                        "totalCallTime": 123
                    }
                },
                {
                    "taskId": 100,
                    "taskName": "测试任务名称one",
                    "status": "RUNNING",
                    "createTime": "2020-09-28 15:15:14",
                    "taskStats": {
                        "importTaskCallNum": 123,
                        "callNum": 123,
                        "unCallNum": 123,
                        "distinctUser": 123,
                        "distinctUserReply": 123,
                        "hangupNum": 123,
                        "distinctUserHighIntention": 123,
                        "callMinuteUsage": 123,
                        "callCntUsage": 123,
                        "callSmsUsage": 123,
                        "avgCallTime": 123,
                        "totalCallTime": 123
                    }
                }
            ]
        }
      }
    }
    let(:name) { 'test' }
    let(:status) { 'RUNNING' }
    let(:page) { 1 }
    let(:page_size) { 10 }
    let(:create_start) { '2021-01-01 00:00:00' }
    let(:create_end) { '2021-01-01 00:00:00' }
    it 'should query_task_list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/task/getTaskList', { name: name, status: status, page: page, pageSize: page_size, createStart: create_start, createEnd: create_end }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_task_list(name, status, page, page_size, create_start, create_end)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_task_detail' do
    let(:response_body) { 
      {
          "requestId": "5B0F201FDCDA45C2AA921AE177F94991",
          "code": 200,
          "msg": "success",
          "data": {
              "taskId": 1,
              "taskName": "dialog测试",
              "botId": 1,
              "botName": "金融行业体验demo-优化版",
              "robotSeat": 12,
              "stopType":1,
              "stopTime":1651199249000,
              "status": "RUNNING",
              "intentTagGroupId":1111,
              "didNumbers": [
                  "053159519761",
                  "20220002",
                  "057156180507"
              ],
              "recall": 1,
              "recallConf": {
                  "interval": 3,
                  "count": 4,
                  "condition": {
                      "replyStatusList": [
                          "ANSWER",
                          "NO_REPLY",
                          "BUSY",
                          "CLOSE",
                          "SHUT_DOWN",
                          "REJECT"
                      ],
                      "intentTagIdList": [
                          123,
                          231,
                          445
                      ]
                  }
              },
              "taskStats": {
                          "importTaskCallNum": 123,
                          "callNum": 123,
                          "unCallNum": 123,
                          "distinctUser": 123,
                          "distinctUserReply": 123,
                          "hangupNum": 123,
                          "distinctUserHighIntention": 123,
                          "callMinuteUsage": 123,
                          "callCntUsage": 123,
                          "callSmsUsage": 123,
                          "avgCallTime": 123,
                          "totalCallTime": 123
              },
              "createTime": 1651199067255,
              "updateTime": 1651199067255
          }
      }
    }
    let(:task_id) { 123456 }
    it 'should query_task_detail' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/task/getTaskDetail', { taskId: task_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_task_detail(task_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_task_properties' do
    let(:response_body) { 
      {
          "requestId": "5B0F201FDCDA45C2AA921AE177F94991",
          "code": 200,
          "msg": "success",
          "data": {
              "importProperties": [
                  {
                      "name": "姓名",
                      "varType": "import",
                      "dataType": "char"
                  },
                  {
                      "name": "年龄1",
                      "varType": "import",
                      "dataType": "number"
                  },
                  {
                      "name": "年龄2",
                      "varType": "import",
                      "dataType": "number"
                  }
              ],
              "dialogProperties": [
                  {
                      "name": "姓名1",
                      "varType": "dialogue",
                      "dataType": "number"
                  },
                  {
                      "name": "年龄3",
                      "varType": "dialogue",
                      "dataType": "number"
                  },
                  {
                      "name": "年龄4",
                      "varType": "dialogue",
                      "dataType": "number"
                  }
              ]
          }
      }
    }
    let(:task_id) { 123456 }
    it 'should query_task_properties' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/task/getTaskProperties', { taskId: task_id }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_task_properties(task_id)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_task_summary' do
    let(:response_body) { 
      {
          "requestId": "5B0F201FDCDA45C2AA921AE177F94991",
          "code": 200,
          "msg": "success",
          "data": {
              "notStartCnt": 1,
              "runningCnt": 1,
              "completeCnt": 1
          }
      }
    }
    it 'should query_task_summary' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/task/taskSummary', { }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_task_summary()).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_console_folder_list' do
    let(:response_body) { 
      {
          "requestId": "5B0F201FDCDA45C2AA921AE177F94991",
          "code": 200,
          "msg": "success",
          "data": [
              {
                  "folderId": 1001,
                  "folderName": "根目录",
                  "encrypt": 1,
                  "children": [
                      {
                          "folderId": 1001,
                          "folderName": "根目录",
                          "encrypt": 1,
                          "children": []
                      }
                  ]
              }
          ]
      }
    }
    it 'should query_console_folder_list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/console/folder/list', { }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_console_folder_list).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end
end
