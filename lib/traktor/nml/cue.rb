module Traktor
  module NML
    class Cue
      attr_reader :name, :type, :start, :length, :repeats, :hotcue

      def initialize(info)
        @name    = info[:name]
        @type    = info[:type]
        @start   = info[:start]
        @length  = info[:length]
        @repeats = info[:repeats]
        @hotcue  = info[:hotcue]
      end

      def [](key)
        return self.instance_variable_get("@#{key.to_s}")
      end
    end
  end
end
