require 'spec_helper'

describe Saran do
  context 'collection' do
    subject do
      Class.new do
        include Saran

        endpoint mock_api_endpoint

        resources :blogs do
          collection do
            get '/blogs'
          end
        end
      end
    end

    it 'sets class name' do
      expect(subject.constants.include?(:Blogs)).to eq(true)
    end

    it 'makes GET request to resources' do
      VCR.use_cassette('get_blogs_collection') do
        resp = subject::Blogs.new.get
        expect(resp.status).to eq(200)
      end
    end
  end

  context 'member' do
    subject do
      Class.new do
        include Saran

        endpoint mock_api_endpoint

        resources :blogs do
          member do
            get '/blogs/:id'
          end
        end
      end
    end

    it 'sets class name' do
      expect(subject.constants.include?(:Blog)).to eq(true)
    end

    it 'makes GET request to resource' do
      VCR.use_cassette('get_blogs_member') do
        resp = subject::Blog.new(1).get
        expect(resp.status).to eq(200)
      end
    end
  end
end
