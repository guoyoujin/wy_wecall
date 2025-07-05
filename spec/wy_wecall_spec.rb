# frozen_string_literal: true

RSpec.describe WyWecall do
  it "has a version number" do
    expect(WyWecall::VERSION).not_to be nil
  end

  context "configuration" do
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

    before do
      WyWecall.configure do |config|
        config.app_key = app_key
        config.app_secret = app_secret
        config.app_type = app_type
        config.base_url = base_url
        config.debug_flag = debug_flag
        config.algorithm = algorithm
        config.connection_adapter = connection_adapter
        config.headers = headers
        config.timeout = timeout
        config.open_timeout = open_timeout
        config.api_path = api_path
        config.api_version = api_version
      end
    end

    it 'configuration should be set' do
      expect(WyWecall.configuration.app_key).to eq(app_key)
      expect(WyWecall.configuration.app_secret).to eq(app_secret)
      expect(WyWecall.configuration.app_type).to eq(app_type)
      expect(WyWecall.configuration.base_url).to eq(base_url)
      expect(WyWecall.configuration.debug_flag).to eq(debug_flag)
      expect(WyWecall.configuration.algorithm).to eq(algorithm)
      expect(WyWecall.configuration.connection_adapter).to eq(connection_adapter)
      expect(WyWecall.configuration.headers).to eq(headers)
      expect(WyWecall.configuration.timeout).to eq(timeout)
      expect(WyWecall.configuration.open_timeout).to eq(open_timeout)
      expect(WyWecall.configuration.api_path).to eq(api_path)
      expect(WyWecall.configuration.api_version).to eq(api_version)
    end
  end
end
