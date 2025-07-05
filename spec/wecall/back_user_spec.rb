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

  
  let(:page) { 1 }
  let(:page_size) { 10 }
  let(:group_name) { 'test' }
  context 'query_black_user_group_list' do
    let(:response_body) { 
      {
        "code": 200,
        "msg": "success",
        "data": {
            "list": [
                {
                    "id": 1,
                    "groupName": "默认分组",
                    "groupDesc": "系统默认分组",
                    "groupType": "DEFAULT",
                    "createTime": 1677224974000,
                    "updateTime": 1678093590000
                },
                {
                    "id": 2,
                    "groupName": "111",
                    "groupDesc": "111",
                    "groupType": "USER_DEFINE",
                    "createTime": 1678360296000,
                    "updateTime": 1678360296000
                },
                {
                    "id": 3,
                    "groupName": "黑名单分组5aaa333",
                    "groupDesc": "分组测试i5",
                    "groupType": "USER_DEFINE",
                    "createTime": 1677583477000,
                    "updateTime": 1678360291000
                }
            ],
            "total": 3,
            "page": 1,
            "pageSize": 10
        }
      }
    }
    it 'should get black user group list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/blackUserGroup/list', { page: page, pageSize: page_size, groupName: group_name }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_black_user_group_list(page, page_size, group_name)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'add_black_user' do
    let(:group_id) { 1 }
    let(:black_user_list) { 
      [
        {
          "name": "接口测试平台test",
          "phone": "15611112222",
          "expireType": "365"
        }
      ]
    }
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

    it 'add_black_user' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/blackuser/add', { groupId: group_id, blackUserList: black_user_list }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.add_black_user(group_id, black_user_list)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'delete_black_user' do
    let(:group_id) { 1 }
    let(:phone_list) { 
      [
        "15611112222"
      ]
    }
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

    it 'delete_black_user' do
      expect_any_instance_of(Faraday::Connection).to receive(:post).with('/open/api/wecall/v1/blackuser/remove', { groupId: group_id, phoneList: phone_list }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.delete_black_user(group_id, phone_list)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_black_user_by_phone' do
    let(:group_id) { 1 }
    let(:phone) { 
      "15611112222"
    }
    let(:response_body) { 
      {
        "requestId": "",
        "code": 200,
        "msg": "success",
        "data": {
            "phone": "15611112222",
            "name": "czh",
        "groupId": 123,
            "creator": "API接口创建",
            "creatorId": "OPENAPI"
        }
      }
    }

    it 'query_black_user_by_phone' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/blackuser/queryByPhone', { groupId: group_id, phone: phone }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_black_user_by_phone(group_id, phone)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end
end
