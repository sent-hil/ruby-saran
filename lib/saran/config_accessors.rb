module Saran
  module ConfigAccessors
    # Private: Creates accessors out of config keys &
    # sets default values.
    #
    # Accepts:
    #   configs - Array of symbols, Hash as last argument.
    #
    # Example:
    #   define_config :endpoint
    #
    #   # This generates:
    #   def endpoint(arg=nil)
    #     @endpoint = arg if arg
    #     @endpoint
    #   end
    #
    #  # can also set default values for config
    #  define_config :endpoint, :post_type => 'google'
    #
    def self.define_config(*configs)
      defaults = configs.last.is_a?(Hash) ? configs.pop : {}
      configs += defaults.keys

      configs.each do |config|
        instance_eval do
          define_method(config) do |value=nil|
            if value
              instance_variable_set("@#{config}", value)
            end

            instance_variable_get("@#{config}") || defaults[config]
          end
        end
      end
    end

    define_config :endpoint, :access_token, :provider,
                  :post_type => :path
  end
end
