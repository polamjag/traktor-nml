require "oga"

module Traktor
  module NML
    class Playlist
      include Enumerable

      attr_reader :tracks

      def initialize(node, collection)
        @tracks = (find_playlist node).first.xpath('PLAYLIST/ENTRY/PRIMARYKEY').map do |track|
          collection.track_from_primarykey track.attribute('KEY').text
        end.compact
      end

      def length
        @tracks.length
      end
      alias_method :size, :length

      def each
        @tracks.each do |track|
          yield track
        end
      end

      def [](i)
        @tracks[i]
      end

      private
      def find_playlist(node)
        node.each do |nd|
          nd.xpath('NODE/SUBNODES').each do |elm|
            if elm.xpath('NODE').size == 0
              return nil
            elsif elm.xpath('NODE[@TYPE="PLAYLIST"]').size > 0
              return elm.xpath('NODE[@TYPE="PLAYLIST"]')
            else
              return find_playlist elm.xpath('NODE/SUBNODES/NODE')
            end
          end
        end
      end
    end
  end
end
