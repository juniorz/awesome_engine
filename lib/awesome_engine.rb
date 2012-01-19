require 'active_support/configurable'
require 'awesome_engine/core_ext/module'

module AwesomeEngine
  include ActiveSupport::Configurable
  autoload :Extendable,   'awesome_engine/extendable'
  autoload :Extension,    'awesome_engine/extension'
  autoload :Extender,     'awesome_engine/extender'
end