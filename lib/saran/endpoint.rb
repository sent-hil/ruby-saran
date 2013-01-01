module Saran
  class Endpoint
    attr_reader :verb, :path, :provider, :endpoint,
      :access_token

    def initialize(verb, path)
      @verb = verb
      @path = path
    end

    def fetch
      client.send(verb, :path => path)
    end

    private

    def client
      provider     = self.provider     || :default
      endpoint     = self.endpoint     || nil
      access_token = self.access_token || nil

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
