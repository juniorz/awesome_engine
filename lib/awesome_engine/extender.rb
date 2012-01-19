module AwesomeEngine
  class Extender
    class << self

      def concern!(base, concern)
        #base.send(:unloadable) # Dá merda se marcar ActiveRecord::Base como unloadable
        concern.send(:unloadable)
        base.extend_with(concern)
      end

    end
  end
end