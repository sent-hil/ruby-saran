module Saran
  class Endpoint
    attr_reader :verb, :path, :provider, :endpoint,
      :access_token

    def initialize(verb, path, config)
      @verb = verb
      @path = path
      @provider = config.provider || :default
      @endpoint = config.endpoint
      @access_token = config.access_token
    end

    def fetch
      client.send(verb, :path => path)
    end

    private

    def client
      config = OpenAuth2::Config.new do |c|
        c.provider     = provider
        c.endpoint     = endpoint
        c.access_token = access_token
      end

      OpenAuth2::Client.new do |c|
        c.config = config
      end
    end
  end
end
