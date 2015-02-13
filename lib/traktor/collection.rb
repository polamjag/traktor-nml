require "oga"

module Traktor
  module NML
    class Collection
      attr_reader :collection

      def initialize(node)
        @collection = node.map do |el|
          {
           title: try_text(el.attribute('TITLE')),
           artist: try_text(el.attribute('ARTIST')),
           album: el.xpath('ALBUM[@TITLE]').attribute('TITLE').map{ |e| e.text }.join(", "),
           primarykey: el.xpath('LOCATION').map do |loc|
             loc.attribute('VOLUME').text + loc.attribute('DIR').text + loc.attribute('FILE').text
           end.first,
           genre: el.xpath('INFO[@GENRE]').attribute('GENRE').map{ |e| e.text }.join(", "),
           label: el.xpath('INFO[@LABEL]').attribute('LABEL').map{ |e| e.text }.join(", "),
           playtime: el.xpath('INFO[@PLAYTIME]').attribute('PLAYTIME').map{ |e| e.text.to_f }.first,
           release_date: el.xpath('INFO[@RELEASE_DATE]').attribute('RELEASE_DATE').map{ |e| e.text }.join(", "),
           bpm: el.xpath('TEMPO[@BPM]').attribute('BPM').map{ |e| e.text.to_f }.first
          }
        end
      end

      def track_from_primarykey(primarykey)
        @collection.select do |track|
          track[:primarykey] == primarykey
        end.first
      end

      def try_text(elm)
        if elm.nil?
          ""
        else
          elm.text
        end
      end
    end
  end
end
