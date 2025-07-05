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
  context 'initialize' do
    it 'should initialize with default values' do
      expect(client.app_key).to eq(app_key)
      expect(client.app_secret).to eq(app_secret)
      expect(client.app_type).to eq(app_type)
      expect(client.base_url).to eq(base_url)
      expect(client.debug_flag).to eq(debug_flag)
      expect(client.algorithm).to eq(algorithm)
      expect(client.connection_adapter).to eq(connection_adapter)
      expect(client.headers).to eq(headers)
      expect(client.timeout).to eq(timeout)
      expect(client.open_timeout).to eq(open_timeout)
      expect(client.api_path).to eq(api_path)
      expect(client.api_version).to eq(api_version)
      expect(client.debug_flag).to eq(debug_flag)
    end
  end
end
