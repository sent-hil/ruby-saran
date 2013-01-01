require 'bundler/setup'
require 'open_auth2'
require 'active_support'
require 'active_support/inflector'

require_relative 'saran/config_accessors'
require_relative 'saran/endpoint'

module Saran
  def self.included(klass)
    klass.extend(ConfigAccessors)
  end
end
