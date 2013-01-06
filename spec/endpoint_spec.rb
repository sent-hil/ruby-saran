require 'spec_helper'

describe Saran::Endpoint, '#fetch' do
  let(:url) { mock_api_endpoint + '/blogs' }

  it 'makes GET request' do
    VCR.use_cassette('get_blogs_collection') do
      resp = described_class.new(:get, url).fetch
      expect(resp.status).to eq(200)
    end
  end

  it 'makes GET request with params' do
    VCR.use_cassette('get_blogs_collection_2') do
      resp = described_class.new(:get, url).fetch(
        :limit => 1)

      expect(JSON.parse(resp.body).count).to eq(1)
    end
  end

  it 'makes POST request with url encoded params' do
    VCR.use_cassette('post_blogs_collection') do
      post_url = url + '?name=Saran'
      resp = described_class.new(:post, post_url).fetch
      expect(resp.status).to eq(200)
    end
  end

  it 'makes POST request with json params' do
    VCR.use_cassette('post_blogs_collection_2') do
      resp = described_class.new(:post, url).fetch({
        :content_type => 'application/json',
        :body => JSON.dump({:name => 'Saran'})})
      expect(resp.status).to eq(200)
    end
  end
end
