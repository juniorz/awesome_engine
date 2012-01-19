require 'active_support/concern'

module AwesomeEngine
  module Extendable
    extend ActiveSupport::Concern

    included do
      config.before_configuration do
        add_paths_for :extensions, :eager_load => true
      end
    end

    protected
    def awesome_path_scope
      AwesomeEngine.config.path_scope || engine_name
    end

    def add_paths_for(name, options={})
      config.paths.add  path_name_for(name), :eager_load => true
      default_paths_for(name, options[:including])
    end

    def default_paths_for(name, including=nil)
      default_paths = Array(including)
      default_paths << "lib/#{awesome_path_scope}/extensions"
      default_paths << "lib/#{ActiveSupport::Inflector.underscore(self.class.parent)}/extensions"

      default_paths.uniq.each do |p|
        paths_for(name) << p
      end
    end

    def extensions_path
      paths_for(:extensions)
    end

    private
    def paths_for(name)
      paths[path_name_for(name)]
    end

    def path_name_for(path)
      "#{awesome_path_scope}/#{path}"
    end

  end
end