require 'active_support/concern'

class Module
  def extend_with(mod=nil, &block)
    if mod.nil? and not block_given?
      raise ArgumentError.new("Module#extend_with expects a module or block")
    end

    mod ||= ::Module.new(&block)
    mod.send(:extend, ActiveSupport::Concern)
    self.send(:include, mod)
  end
end