require "traktor/nml/version"
require "oga"

module Traktor
  module NML
    def self.parse(content)
      doc = Oga.parse_xml content
      collection = doc.xpath('NML/COLLECTION/ENTRY').map do |el|
        {
         title: el.attribute('TITLE').text,
         artist: el.attribute('ARTIST').text,
         album: el.xpath('ALBUM[@TITLE]').attribute('TITLE').map{ |e| e.text }.join(", "),
         primarykey: el.xpath('LOCATION').map do |loc|
           loc.attribute('VOLUME').text + loc.attribute('DIR').text + loc.attribute('FILE').text
         end.join,
         genre: el.xpath('INFO[@GENRE]').attribute('GENRE').map{ |e| e.text }.join(", "),
         label: el.xpath('INFO[@LABEL]').attribute('LABEL').map{ |e| e.text }.join(", "),
         playtime: el.xpath('INFO[@PLAYTIME]').attribute('PLAYTIME').map{ |e| e.text.to_f }.join,
         release_date: el.xpath('INFO[@RELEASE_DATE]').attribute('RELEASE_DATE').map{ |e| e.text }.join(", "),
         bpm: el.xpath('TEMPO[@BPM]').attribute('BPM').map{ |e| e.text.to_f }.first
        }
      end
      setlist = doc.xpath('NML/PLAYLISTS/NODE/SUBNODES/NODE[@TYPE="PLAYLIST"]').map do |sl|
        {
         name: sl.attribute('NAME').text,
         tracks: sl.xpath('PLAYLIST/ENTRY/PRIMARYKEY[@TYPE="TRACK"]').map do |entry|
           collection.select do |elm|
             elm[:primarykey] == entry.attribute('KEY').text
           end.first
         end.compact
        }
      end
      setlist.each do |sl|
        sl[:tracks].each do |tr|
          tr.delete(:primarykey)
        end
      end
      setlist
    end
  end
end
