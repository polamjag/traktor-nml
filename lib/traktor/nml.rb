require "traktor/nml/file"

module Traktor
  module NML
    class << self
      def parse(content)
        Traktor::NML::File.new(content).playlist
      end

      def load(filepath)
        Traktor::NML::File.new(::File.read filepath).playlist
      end
    end
  end
end
