require "traktor/collection"
require "traktor/playlist"
require "traktor/nml/version"
require "oga"

module Traktor
  module NML
    def self.parse(content)
      doc = Oga.parse_xml content
      col = Traktor::NML::Collection.new doc.xpath('NML/COLLECTION/ENTRY')
      setlist = Traktor::NML::Playlist.new doc.xpath('NML/PLAYLISTS'), col
      setlist.tracks
    end
  end
end
