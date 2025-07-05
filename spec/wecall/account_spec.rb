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
  context 'query_account' do
    let(:response_body) { 
      {
        "requestId": "5B0F201FDCDA45C2AA921AE177F94991",
        "code": 200,
        "msg": "success",
        "data": {
          "status": "AVAILABLE",
          "updateTime": 1651199067255
        }
      }
    }
    it 'should get account info' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/account/get', {}).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_account).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end
end
