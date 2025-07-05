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
  context 'query_call_order_list' do
    let(:response_body) { 
      {
        "requestId": "7f046b0e08fa4db984d1c6ffcb095375.128.17363998115833687",
        "code": 200,
        "msg": "success",
        "data": {
          "list": [{
            "orderId": "DD20240711200216000721949038",
            "servicePackageId": 14198,
            "orderStatus": 1,
            "rechargeBalance": 200.0,
            "remainingBalance": 86.38,
            "expireBalance": 0.0,
            "discountBalance": 50.0,
            "paymentBalance": 150.0,
            "startTime": 1720699358000,
            "endTime": 1783699200000
          }],
          "total": 6,
          "page": 1,
          "pageSize": 30
        }
      }
    }

    let(:page) { 1 }
    let(:page_size) { 10 }
    it 'should get call order list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/wallet/order/getCallOrder', { page: page, pageSize: page_size }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_call_order_list(page, page_size)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end

  context 'query_sms_order_list' do
    let(:response_body) { 
      {
        "requestId": "7f046b0e08fa4db984d1c6ffcb095375.128.17363998115833687",
        "code": 200,
        "msg": "success",
        "data": {
          "list": [{
            "orderId": "DD20240711200216000721949038",
            "servicePackageId": 14198,
            "orderStatus": 1,
            "rechargeBalance": 200.0,
            "remainingBalance": 86.38,
            "expireBalance": 0.0,
            "discountBalance": 50.0,
            "paymentBalance": 150.0,
            "startTime": 1720699358000,
            "endTime": 1783699200000
          }],
          "total": 6,
          "page": 1,
          "pageSize": 30
        }
      }
    }

    let(:page) { 1 }
    let(:page_size) { 10 }
    it 'should get sms order list' do
      expect_any_instance_of(Faraday::Connection).to receive(:get).with('/open/api/wecall/v1/wallet/order/getSmsOrder', { page: page, pageSize: page_size }).and_return(status: 200, response_headers: response_headers, body: response_body) 
      expect(client.query_sms_order_list(page, page_size)).to eq({
        status: 200,
        response_headers: response_headers,
        body: response_body
      })
    end
  end
end
