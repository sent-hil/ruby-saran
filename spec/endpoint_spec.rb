require 'spec_helper'

describe Saran::Endpoint do
  let(:path) { mock_api_endpoint + '/blogs' }

  it 'makes GET request' do
    VCR.use_cassette('get_blogs_collection') do
      response = described_class.new(:get, path).fetch
      expect(response.status).to eq(200)
    end
  end

  it 'makes POST request' do
    VCR.use_cassette('post_blogs_collection') do
      response = described_class.new(:post, path).fetch
      expect(response.status).to eq(200)
    end
  end
end
