module Traktor
  module NML
    class Track
      attr_reader :title, :artist, :album,
        :primarykey,
        :genre, :label, :release_date,
        :playtime, :bpm, :key, :musical_key,
        :cues

      def initialize(info)
        @title        = info[:title]
        @artist       = info[:artist]
        @album        = info[:album]
        @primarykey   = info[:primarykey]
        @genre        = info[:genre]
        @label        = info[:label]
        @release_date = info[:release_date]
        @playtime     = info[:playtime]
        @bpm          = info[:bpm]
        @key          = info[:key]
        @musical_key  = info[:musical_key]
        @cues         = info[:cues]
      end

      def [](key)
        return self.instance_variable_get("@#{key.to_s}")
      end
    end
  end
end
