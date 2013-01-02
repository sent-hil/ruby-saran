require 'spec_helper'

describe Saran::Endpoint do
  let(:path) { mock_api_endpoint + '/blogs' }
  let(:config) do
    Struct.new(:provider, :endpoint, :access_token).new
  end

  it 'makes GET request' do
    VCR.use_cassette('get_blogs_collection') do
      resp = described_class.new(:get, path, config).fetch
      expect(resp.status).to eq(200)
    end
  end

  it 'makes POST request' do
    VCR.use_cassette('post_blogs_collection') do
      resp = described_class.new(:post, path, config).fetch
      expect(resp.status).to eq(200)
    end
  end
end
