require 'spec_helper'

describe Traktor::NML do
  it 'has a version number' do
    expect(Traktor::NML::VERSION).not_to be nil
  end

  it 'can parse nml file' do
    expect((Traktor::NML.parse File.open (File.join (File.dirname(__FILE__)), "win.nml")).first[:tracks].length).to eq(40)
  end
end
