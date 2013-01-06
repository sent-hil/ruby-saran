require 'spec_helper'

describe Saran, 'config' do
  subject do
    rspec = self
    klass = Class.new do
      include Saran

      endpoint rspec.send(:mock_api_endpoint)
    end
  end

  it 'defines getters' do
    expect(subject.endpoint).to eq(mock_api_endpoint)
    expect(subject.access_token).to eq(nil)
  end

  it 'defines setters' do
    subject.endpoint(mock_api_endpoint)
    expect(subject.endpoint).to eq(mock_api_endpoint)
  end
end
