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

  context 'query_sms_template_list' do
    let(:response_body) { 
      {
        "requestId": "",
        "code": 200,
        "msg": "success",
        "data": {
          "data": [
            {
              "id": 101,
              "name": "测试短信名称1",
              "type": 2,
              "content": "测试内容1",
              "auditStatus": 0,
              "auditInfo": "审核提交内容1",
              "status": 1,
              "staffId": 901,
              "createTime": 1646289866000,
              "updateTime": 1646289866000,
              "signName": "测试签名1"
            },
            {
              "id": 102,
              "name": "测试短信名称2",
              "type": 2,
              "content": "测试内容2",
              "auditStatus": 0,
              "auditInfo": "审核提交内容2",
              "status": 1,
              "staffId": 902,
              "createTime": 1646289866000,
              "updateTime": 1646289866000,
              "signName": "测试签名2"
            },
            {
              "id": 103,
              "name": "测试短信名称3",
              "type": 2,
              "content": "测试内容3",
              "auditStatus": 0,
              "auditInfo": "审核提交内容3",
              "status": 1,
              "staffId": 903,
              "createTime": 1646289866000,
              "updateTime": 1646289866000,
              "signName": "测试签名3"
            }
          ],
          "total": 3
        }
      }
    }

    let(:keyword) { 'test' }
    it 'should sms template list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/sms/getTemplateList', { keyword: keyword }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_sms_template_list(keyword)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_valid_sms_template_list' do
    let(:response_body) { 
      {
        "requestId": "",
        "code": 200,
        "msg": "success",
        "data": [
          {
            "id": 101,
            "type": 2,
            "name": "通知模版1",
            "content": "通知内容1",
            "sign": "通知签名1"
          },
          {
            "id": 102,
            "type": 2,
            "name": "通知模版2",
            "content": "通知内容2",
            "sign": "通知签名2"
          },
          {
            "id": 103,
            "type": 3,
            "name": "营销模板1",
            "content": "营销内容1",
            "sign": "营销签名1"
          }
        ]
      }
    }

    let(:keyword) { 'test' }
    it 'should sms valid template list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/sms/getValidTemplateList', { keyword: keyword }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_valid_sms_template_list(keyword)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end


  context 'query_sms_send_record_list' do
    let(:response_body) { 
      {
      "requestId": "",
      "code": 200,
      "msg": "success",
      "data": [
          {
            "id": 101,
            "taskCallId": "abcd",
            "smsTemplateId": 2,
            "smsTemplateName": "模版2",
            "phone": 13100000001,
            "sendUserName": "用户01",
            "smsTaskId": 1,
            "smsTaskName": "外呼任务01",
            "status": 1,
            "nimCostCount": 1,
            "hasRetry": 0,
            "hasReply": 0,
            "replyContext": "TD",
            "sendTime": 1646289866000
          },
          {
            "id": 101,
            "taskCallId": "abcde",
            "smsTemplateId": 2,
            "smsTemplateName": "模版2",
            "phone": 13100000001,
            "sendUserName": "用户02",
            "smsTaskId": 1,
            "smsTaskName": "外呼任务02",
            "status": 1,
            "nimCostCount": 1,
            "hasRetry": 0,
            "hasReply": 0,
            "replyContext": "TD",
            "sendTime": 1646289866000
          },
          {
            "id": 101,
            "taskCallId": "abcdef",
            "smsTemplateId": 2,
            "smsTemplateName": "模版3",
            "phone": 13100000001,
            "sendUserName": "用户03",
            "smsTaskId": 1,
            "smsTaskName": "外呼任务03",
            "status": 1,
            "nimCostCount": 1,
            "hasRetry": 0,
            "hasReply": 0,
            "replyContext": "TD",
            "sendTime": 1646289866000
          }
        ]
      }
    }

    let(:task_id) { '123456' }
    let(:call_time) { '2025-01-01 00:00:00' } 
    let(:page) { 1 }
    let(:page_size) { 10 }
    it 'should sms valid template list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/sms/getSmsSendRecordList', { taskId: task_id, callTime: call_time, page: page, pageSize: page_size }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_sms_send_record_list(task_id, call_time, page, page_size)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

end
