module Saran
  module Dsl
    # Holds a RESTful resource collection & member objects.
    class Resource
      attr_reader :endpoint

      def initialize(name, endpoint)
        @name = name
        @endpoint = endpoint
      end

      def collection_name
        name.pluralize
      end

      def member_name
        name.singularize
      end

      def name
        @name.to_s.capitalize
      end
    end

    class Res
      class << self
        attr_accessor :resource, :routes
      end

      attr_reader :id

      def initialize(id=nil)
        @id = id
      end

      def method_missing(name, *args, &blk)
        ep = self.class.routes.find do |route|
          route.verb == name
        end

        ep.url.gsub(':id', id.to_s)
        ep.fetch(*args)
      end
    end

    # Holds a RESTful resource collection routes.
    class Collection < Res; end

    # Holds a RESTful resource member routes.
    class Member < Res; end

    # Instantiates Resource, saves it under scope &
    # calls blk in that context.
    def resources(name, &blk)
      with_scope(:resource, blk) do
        Resource.new(name, endpoint)
      end
    end

    # Instantiates Collection, saves it under scope &
    # calls blk in that context.
    def collection(&blk)
      with_res_scope(Collection, blk) do |klass|
        self.const_set(@resource.collection_name, klass)
      end
    end

    # Instantiates Member, saves it under scope & calls
    # blk in that context.
    def member(&blk)
      with_res_scope(Member, blk) do |klass|
        self.const_set(@resource.member_name, klass)
      end
    end

    # Creates Endpoint that saves it under current scope.
    def get(path)
      url = endpoint+path
      @scope.routes << Endpoint.new(:get, url, client)
    end

    private

    def with_res_scope(klass, blk)
      with_scope(:scope, blk) do
        klass = Class.new(klass)
        klass.resource = @resource
        klass.routes ||= []
        yield(klass)

        klass
      end
    end

    def with_scope(scope, blk)
      instance_variable_set("@#{scope.to_s}", yield)
      blk.call
      scope = nil
    end
  end
end
