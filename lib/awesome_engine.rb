require 'active_support/configurable'

module AwesomeEngine
  include ActiveSupport::Configurable

  autoload :Extendable,   'awesome_engine/extendable'
  autoload :Extension,    'awesome_engine/extension'
end