require 'spec_helper'

describe Traktor::NML do
  before do
    @path_nml_win = (File.join File.dirname(__FILE__), "win.nml")
    @path_nml_win_embedded = (File.join File.dirname(__FILE__), "win_in_folder.nml")
    @path_nml_osx = (File.join File.dirname(__FILE__), "osx.nml")
  end

  it 'has a version number' do
    expect(Traktor::NML::VERSION).not_to be nil
  end

  it 'can parse nml file ver 18' do
    expect((Traktor::NML.parse File.open @path_nml_win).length).to eq(40)
  end
  it 'can parse nml file ver 18, playlist is in directory' do
    expect((Traktor::NML.parse File.open @path_nml_win_embedded).length).to eq(43)
  end
  it 'can parse nml file of OSX, ver 16' do
    expect((Traktor::NML.parse File.open @path_nml_osx).length).to eq(34)
  end

  describe Traktor::NML::Playlist do
    before do
      @playlist = Traktor::NML.load @path_nml_win
    end

    it 'has length' do
      expect(@playlist.length).to eq 40
    end

    it 'is Enumerable' do
      expect(@playlist.map{|pl| pl.title }.length).to eq 40
    end

    it 'is directly accessed to elements via []' do
      expect(@playlist[10].genre).to eq 'Electro House'
    end
  end

  describe Traktor::NML::Collection do
    before do
      @file = Traktor::NML::File.new ::File.read @path_nml_win
    end

    it 'has length' do
      expect(@file.collection.length).to eq 40
    end

    it 'is Enumerable' do
      expect(@file.collection.map{|pl| pl.title }.length).to eq 40
    end

    it 'is directly accessed to elements via []' do
      expect(@file.collection[10].genre).to eq 'Progressive House'
    end
  end

  describe Traktor::NML::Track do
    before do
      @playlist = Traktor::NML.load @path_nml_win
      @track = @playlist[3]
    end

    describe 'accessor' do
      it 'works as method' do
        expect(@track.title).to eq "Drop (Original Mix)"
      end

      it 'works as [String]' do
        expect(@track["title"]).to eq "Drop (Original Mix)"
      end

      it 'works as [Symbol]' do
        expect(@track[:title]).to eq "Drop (Original Mix)"
      end
    end
  end

  describe Traktor::NML::Cue do
    before do
      @playlist = Traktor::NML.load @path_nml_win
      @cues = @playlist[3].cues
      @cue = @cues[0]
    end

    describe 'accessor' do
      it 'works as method' do
        expect(@cue.name).to eq "AutoGrid"
      end

      it 'works as [String]' do
        expect(@cue["name"]).to eq "AutoGrid"
      end

      it 'works as [Symbol]' do
        expect(@cue[:name]).to eq "AutoGrid"
      end
    end
  end
end
