require 'bundler/setup'
require 'active_support'
require 'active_support/inflector'

require_relative 'saran/config_accessors'

module Saran
  def self.included(klass)
    klass.extend(ConfigAccessors)
  end
end
