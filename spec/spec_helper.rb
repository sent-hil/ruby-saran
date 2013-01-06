require 'pry'
require 'vcr'
require 'saran'
require 'json'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
end

def mock_api_endpoint
  'http://localhost:9393/restful'
end
