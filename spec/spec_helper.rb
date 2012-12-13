require 'pry'
require 'saran'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
end

def mock_access_token
  1
end

def mock_api_endpoint
  'http://localhost:9393'
end
