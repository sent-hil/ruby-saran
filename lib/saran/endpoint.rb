module Saran

  # Make http requests.
  class Endpoint
    attr_reader :verb, :url

    # Accepts:
    #   verb - Symbol, http verb
    #   url - String, full url to make request
    #
    # Examples:
    #   Endpoint.new(:get, 'http://graph.facebook.com/me/feed')
    #   Endpoint.new(:post,
    #     'http://graph.facebook.com/me/feed?message=Hi&access_token=..')
    #
    def initialize(verb, url)
      @verb = verb
      @url = url
    end

    # Make request.
    def fetch
      client.send(verb, :path => url)
    end

    private

    def client
      OpenAuth2::Client.new
    end
  end
end
