# Traktor::NML

[![Circle CI](https://circleci.com/gh/polamjag/traktor-nml.svg?style=svg)](https://circleci.com/gh/polamjag/traktor-nml)
[![Gem Version](https://badge.fury.io/rb/traktor-nml.svg)](http://badge.fury.io/rb/traktor-nml)

Ruby library to parse NI Traktor's nml playlist file

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'traktor-nml'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install traktor-nml

## Usage

```ruby
require 'traktor/nml'

Traktor::NML.parse File.open("path/to/playlist.nml")
Traktor::NML.load "path/to/playlist.nml"
# or
Traktor::NML.parse content_of_nml
```

`Traktor::NML.parse` will return array of hash like this:

```irb
irb(main):001:0> require 'traktor/nml'
=> true
irb(main):002:0> Traktor::NML.parse(File.read(File.expand_path "./spec/traktor/traktor-nml-demo.nml"))
=> #<Traktor::NML::Playlist:0x007f8f3bbdd270 @tracks=[
  #<Traktor::NML::Track:0x007f8f3bbfc058
    @title="Green Night Parade (PandaBoY Remix)",
    @artist="fu_mou",
    @album={:title=>"Green Night Parade EP", :track=>"6"},
    @primarykey="G:/:Music/:fu_mou/:Green Night Parade EP/:06 Green Night Parade (PandaBoY Remi.mp3",
    @genre="ALTEMA Records",
    @label="",
    @release_date="2011/1/1",
    @playtime=371.0,
    @bpm=131.999,
    @key="3d",
    @musical_key="2",
    @cues=[
      #<Traktor::NML::Cue:0x007f8f3bbfeb28 @name="n.n.", @type=0, @start=483.713, @length=0.0, @repeats=-1, @hotcue=0>,
      #<Traktor::NML::Cue:0x007f8f3bbfe538 @name="n.n.", @type=4, @start=4119.93, @length=0.0, @repeats=-1, @hotcue=1>,
      #<Traktor::NML::Cue:0x007f8f3bbfdf48 @name="n.n.", @type=0, @start=33211.1, @length=0.0, @repeats=-1, @hotcue=2>,
      #<Traktor::NML::Cue:0x007f8f3bbfd958 @name="n.n.", @type=0, @start=47756.6, @length=0.0, @repeats=-1, @hotcue=3>,
      #<Traktor::NML::Cue:0x007f8f3bbfd340 @name="n.n.", @type=0, @start=76847.6, @length=0.0, @repeats=-1, @hotcue=4>,
      #<Traktor::NML::Cue:0x007f8f3bbfcd00 @name="n.n.", @type=0, @start=91393.2, @length=0.0, @repeats=-1, @hotcue=5>,
      #<Traktor::NML::Cue:0x007f8f3bbfc6c0 @name="n.n.", @type=0, @start=120484.0,@length=0.0, @repeats=-1, @hotcue=6>,
      #<Traktor::NML::Cue:0x007f8f3bbfc0a8 @name="n.n.", @type=0, @start=149576.0, @length=0.0, @repeats=-1, @hotcue=7>
    ]
  >,
  #<Traktor::NML::Track:0x007f8f3bc14dd8
    @title="Sweet Tear(Y calla K Cut Electro Remix)",
    @artist="Calla Soiled",
    @album={:title=>"Sweet Tear EP", :track=>"2"},
    @primarykey="G:/:Music/:Calla Soiled/:Sweet Tear EP/:02 Sweet Tear(Y calla K Cut Electro.mp3",
    @genre="ALTEMA Records",
    @label="",
    @release_date="2010/1/1",
    @playtime=320.0,
    @bpm=132.0,
    @key="12d",
    @musical_key="5",
    @cues=[
      #<Traktor::NML::Cue:0x007f8f3bc74b48 @name="n.n.", @type=0, @start=26.5843, @length=0.0, @repeats=-1, @hotcue=0>,
      #<Traktor::NML::Cue:0x007f8f3bc74558 @name="n.n.", @type=4, @start=3666.41, @length=0.0, @repeats=-1, @hotcue=1>,
      #<Traktor::NML::Cue:0x007f8f3bc17e98 @name="n.n.", @type=0, @start=18208.4, @length=0.0, @repeats=-1, @hotcue=2>,
      #<Traktor::NML::Cue:0x007f8f3bc17330 @name="n.n.", @type=0, @start=32753.9, @length=0.0, @repeats=-1, @hotcue=3>,
      #<Traktor::NML::Cue:0x007f8f3bc167c8 @name="n.n.", @type=0, @start=47299.3, @length=0.0, @repeats=-1, @hotcue=4>,
      #<Traktor::NML::Cue:0x007f8f3bc15cb0 @name="n.n.", @type=0, @start=90935.7, @length=0.0, @repeats=-1, @hotcue=5>,
      #<Traktor::NML::Cue:0x007f8f3bc15468 @name="n.n.", @type=0, @start=120027.0, @length=0.0, @repeats=-1, @hotcue=6>,
      #<Traktor::NML::Cue:0x007f8f3bc14e28 @name="n.n.", @type=0, @start=149117.0, @length=0.0, @repeats=-1, @hotcue=7>
    ]
  >,
  #<Traktor::NML::Track:0x007f8f3bbde620
    @title="もしも星屑が泣いたとして",
    @artist="Calla Soiled",
    @album={:title=>"Dirty Nucleus", :track=>"7"},
    @primarykey="G:/:Music/:Calla Soiled/:Dirty Nucleus/:07 もしも星屑が泣いたとして.mp3",
    @genre="",
    @label="",
    @release_date="2010/1/1",
    @playtime=362.0,
    @bpm=139.005,
    @key="11m",
    @musical_key="19",
    @cues=[
      #<Traktor::NML::Cue:0x007f8f3bbe5948 @name="Beat Marker", @type=4, @start=434.042, @length=0.0, @repeats=-1, @hotcue=-1>,
      #<Traktor::NML::Cue:0x007f8f3bbe52e0 @name="n.n.", @type=4, @start=434.042, @length=0.0, @repeats=-1, @hotcue=0>,
      #<Traktor::NML::Cue:0x007f8f3bbe4bd8 @name="n.n.", @type=0, @start=14246.2, @length=0.0, @repeats=-1, @hotcue=1>,
      #<Traktor::NML::Cue:0x007f8f3bbe4520 @name="n.n.", @type=0, @start=28058.7, @length=0.0, @repeats=-1, @hotcue=2>,
      #<Traktor::NML::Cue:0x007f8f3bbdfe80 @name="n.n.", @type=0, @start=41871.4, @length=0.0, @repeats=-1, @hotcue=3>,
      #<Traktor::NML::Cue:0x007f8f3bbdf840 @name="n.n.", @type=0, @start=55683.6, @length=0.0, @repeats=-1, @hotcue=4>,
      #<Traktor::NML::Cue:0x007f8f3bbdf250 @name="n.n.", @type=0, @start=83308.5, @length=0.0, @repeats=-1, @hotcue=5>,
      #<Traktor::NML::Cue:0x007f8f3bbdec60 @name="n.n.", @type=0, @start=97121.0, @length=0.0, @repeats=-1, @hotcue=6>,
      #<Traktor::NML::Cue:0x007f8f3bbde670 @name="n.n.", @type=0, @start=124746.0,@length=0.0, @repeats=-1, @hotcue=7>
    ]
  >
]>
```

## Notice

* Release date may be like `YYYY/1/1` when only YEAR is specified in file

## Contributing

1. Fork it ( https://github.com/polamjag/traktor-nml/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
