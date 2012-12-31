require 'spec_helper'

describe Saran do
  context 'config' do
    subject do
      rspec = self
      klass = Class.new do
        include Saran

        endpoint rspec.send(:mock_api_endpoint)
      end
    end

    it 'gets endpoint' do
      expect(subject.endpoint).to eq(mock_api_endpoint)
    end

    it 'gets default config' do
      expect(subject.post_type).to eq(:path)
    end

    it 'sets endpoint' do
      subject.endpoint(mock_api_endpoint)
      expect(subject.endpoint).to eq(mock_api_endpoint)
    end
  end
end
