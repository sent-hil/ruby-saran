require 'spec_helper'

describe Saran::Endpoint do
  let(:url) { mock_api_endpoint + '/blogs' }

  it 'makes GET request' do
    VCR.use_cassette('get_blogs_collection') do
      resp = described_class.new(:get, url).fetch
      expect(resp.status).to eq(200)
    end
  end

  it 'makes POST request' do
    VCR.use_cassette('post_blogs_collection') do
      resp = described_class.new(:post, url).fetch
      expect(resp.status).to eq(200)
    end
  end
end
