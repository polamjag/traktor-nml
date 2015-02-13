require 'spec_helper'

describe Traktor::NML do
  it 'has a version number' do
    expect(Traktor::NML::VERSION).not_to be nil
  end

  it 'can parse nml file ver 18' do
    expect((Traktor::NML.parse File.open (File.join File.dirname(__FILE__), "win.nml")).length).to eq(40)
  end
  it 'can parse nml file ver 18, playlist is in directory' do
    expect((Traktor::NML.parse File.open (File.join File.dirname(__FILE__), "win_in_folder.nml")).length).to eq(43)
  end
  it 'can parse nml file of OSX, ver 16' do
    expect((Traktor::NML.parse File.open (File.join File.dirname(__FILE__), "osx.nml")).length).to eq(34)
  end
end
