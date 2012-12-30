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
      subject.endpoint.should == mock_api_endpoint
    end

    it 'gets default config' do
      subject.post_type.should == :path
    end

    it 'sets endpoint' do
      subject.endpoint(mock_api_endpoint)
      subject.endpoint.should == mock_api_endpoint
    end
  end
end
