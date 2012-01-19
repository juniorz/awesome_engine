require 'active_support/core_ext/module'

module AwesomeEngine
  class Extension
    class << self
      def inherited(base)
        base.send(:unloadable)
      end

      def concern!
        constants.map(&:to_s).each do |const_name|
          next unless is_concern?(const_name)

          concerned_class = safe_constantize(concern_target(const_name).camelize)

          unless concerned_class.nil?
            concerned_class.send(:unloadable)
            concerned_class.extend_with(const_get(const_name))
          end
        end
      end

      private
      def is_concern?(name)
        name.underscore.ends_with?("_concern")
      end

      def safe_constantize(name)
        begin
          name.constantize
        rescue NameError
          nil
        end
      end

      def concern_target(name)
        concern_path = name.underscore
        concern_path[0, concern_path.rindex("_")]
      end

      def valid_concerns
        @valid_concerns ||= constants.map(&:to_s).map(&:underscore).reject{|c| not c.ends_with?("_concern")}
      end
    end
  end
end