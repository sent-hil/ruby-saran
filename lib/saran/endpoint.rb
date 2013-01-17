module Saran
  # Make http requests.
  class Endpoint
    attr_reader :verb, :url

    # Accepts:
    #   verb - Symbol, http verb i.e. :get, :post etc.
    #   url - String, full url to make request
    #
    # Examples:
    #   Endpoint.new(:get,
    #     'https://graph.facebook.com/me/feed')
    def initialize(verb, url)
      @verb = verb
      @url = url
    end

    # Make request.
    #
    # Accepts:
    #   params - Hash, arguments for http verb request.
    #
    # Examples:
    #   ep = Endpoint.new(:get,
    #     'https://graph.facebook.com/me/feed')
    #   ep.fetch(:limit => 1)
    #
    #   ep = Endpoint.new(:post,
    #     'http://localhost:9393/restful/blogs')
    #   ep.fetch(:body => {'name' => 'Introducing Saran'})
    def fetch(params={})
      client.send(verb, url, params)
    end

    private

    def client
      OpenAuth2::Client.new
    end
  end
end
