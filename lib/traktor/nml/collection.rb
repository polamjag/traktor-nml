require "oga"
require "traktor/nml/track"
require "traktor/nml/cue"

module Traktor
  module NML
    class Collection
      attr_reader :collection

      def initialize(node)
        @collection = node.map do |el|
          Traktor::NML::Track.new({
            title: try_text(el.attribute('TITLE')),
            artist: try_text(el.attribute('ARTIST')),
            album: {
              title: el.xpath('ALBUM[@TITLE]').attribute('TITLE').map{ |e| e.text }.join(", "),
              track: try_text(el.xpath('ALBUM[@TRACK]').attribute('TRACK').first),
            },
            primarykey: el.xpath('LOCATION').map { |loc|
              loc.attribute('VOLUME').text + loc.attribute('DIR').text + loc.attribute('FILE').text
            }.first,
            genre: el.xpath('INFO[@GENRE]').attribute('GENRE').map{ |e| e.text }.join(", "),
            label: el.xpath('INFO[@LABEL]').attribute('LABEL').map{ |e| e.text }.join(", "),
            playtime: el.xpath('INFO[@PLAYTIME]').attribute('PLAYTIME').map{ |e| e.text.to_f }.first,
            release_date: el.xpath('INFO[@RELEASE_DATE]').attribute('RELEASE_DATE').map{ |e| e.text }.join(", "),
            bpm: el.xpath('TEMPO[@BPM]').attribute('BPM').map{ |e| e.text.to_f }.first,
            key: try_text(el.xpath('INFO[@KEY]').attribute('KEY').first),
            musical_key: try_text(el.xpath('MUSICAL_KEY[@VALUE]').attribute('VALUE').first),
            cues: el.xpath('CUE_V2').map do |cue|
              Traktor::NML::Cue.new({
                name: cue.attribute('NAME').value,
                type: cue.attribute('TYPE').value.to_i,
                start: cue.attribute('START').value.to_f,
                length: cue.attribute('LEN').value.to_f,
                repeats: cue.attribute('REPEATS').value.to_i,
                hotcue: cue.attribute('HOTCUE').value.to_i
              })
            end
          })
        end
      end

      def track_from_primarykey(primarykey)
        @collection.select do |track|
          track.primarykey == primarykey
        end.first
      end

      def length
        collection.length
      end
      alias_method :size, :length

      private
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
