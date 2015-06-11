require "oga"
require "traktor/nml/collection"
require "traktor/nml/playlist"

module Traktor
  module NML
    class File
      attr_reader :collection, :playlist

      def initialize(content)
        doc = Oga.parse_xml content

        @collection = Traktor::NML::Collection.new doc.xpath('NML/COLLECTION/ENTRY')
        @playlist   = Traktor::NML::Playlist.new doc.xpath('NML/PLAYLISTS'), @collection

        self
      end
    end
  end
end
