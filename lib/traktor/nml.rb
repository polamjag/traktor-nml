require "traktor/nml/file"

module Traktor
  module NML
    def self.parse(content)
      Traktor::NML::File.new(content).playlist
    end
  end
end
