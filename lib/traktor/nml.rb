require "traktor/nml/file"

module Traktor
  module NML
    class << self
      def parse(content)
        Traktor::NML::File.new(content).playlist
      end

      def load(filepath)
        Traktor::NML::File.new File.read File.expand_path filepath
      end
    end
  end
end
