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
# or
Traktor::NML.parse content_of_nml
```

`Traktor::NML.parse` will return array of hash like this:

```ruby
[{:title=>"Green Night Parade (PandaBoY Remix)",
  :artist=>"fu_mou",
  :album=>{:title=>"Green Night Parade EP", :track=>"6"},
  :primarykey=>"G:/:Music/:fu_mou/:Green Night Parade EP/:06 Green Night Parade (PandaBoY Remi.mp3",
  :genre=>"ALTEMA Records",
  :label=>"",
  :playtime=>371.0,
  :release_date=>"2011/1/1",
  :bpm=>131.999,
  :key=>"3d",
  :musical_key=>"2",
  :cues=>
   [{:name=>"n.n.", :type=>0, :start=>483.713, :length=>0.0, :repeats=>-1, :hotcue=>0},
    {:name=>"n.n.", :type=>4, :start=>4119.93, :length=>0.0, :repeats=>-1, :hotcue=>1},
    {:name=>"n.n.", :type=>0, :start=>33211.1, :length=>0.0, :repeats=>-1, :hotcue=>2},
    {:name=>"n.n.", :type=>0, :start=>47756.6, :length=>0.0, :repeats=>-1, :hotcue=>3},
    {:name=>"n.n.", :type=>0, :start=>76847.6, :length=>0.0, :repeats=>-1, :hotcue=>4},
    {:name=>"n.n.", :type=>0, :start=>91393.2, :length=>0.0, :repeats=>-1, :hotcue=>5},
    {:name=>"n.n.", :type=>0, :start=>120484.0, :length=>0.0, :repeats=>-1, :hotcue=>6},
    {:name=>"n.n.", :type=>0, :start=>149576.0, :length=>0.0, :repeats=>-1, :hotcue=>7}]},
 {:title=>"Sweet Tear(Y calla K Cut Electro Remix)",
  :artist=>"Calla Soiled",
  :album=>{:title=>"Sweet Tear EP", :track=>"2"},
  :primarykey=>"G:/:Music/:Calla Soiled/:Sweet Tear EP/:02 Sweet Tear(Y calla K Cut Electro.mp3",
  :genre=>"ALTEMA Records",
  :label=>"",
  :playtime=>320.0,
  :release_date=>"2010/1/1",
  :bpm=>132.0,
  :key=>"12d",
  :musical_key=>"5",
  :cues=>
   [{:name=>"n.n.", :type=>0, :start=>26.5843, :length=>0.0, :repeats=>-1, :hotcue=>0},
    {:name=>"n.n.", :type=>4, :start=>3666.41, :length=>0.0, :repeats=>-1, :hotcue=>1},
    {:name=>"n.n.", :type=>0, :start=>18208.4, :length=>0.0, :repeats=>-1, :hotcue=>2},
    {:name=>"n.n.", :type=>0, :start=>32753.9, :length=>0.0, :repeats=>-1, :hotcue=>3},
    {:name=>"n.n.", :type=>0, :start=>47299.3, :length=>0.0, :repeats=>-1, :hotcue=>4},
    {:name=>"n.n.", :type=>0, :start=>90935.7, :length=>0.0, :repeats=>-1, :hotcue=>5},
    {:name=>"n.n.", :type=>0, :start=>120027.0, :length=>0.0, :repeats=>-1, :hotcue=>6},
    {:name=>"n.n.", :type=>0, :start=>149117.0, :length=>0.0, :repeats=>-1, :hotcue=>7}]},
 {:title=>"もしも星屑が泣いたとして",
  :artist=>"Calla Soiled",
  :album=>{:title=>"Dirty Nucleus", :track=>"7"},
  :primarykey=>"G:/:Music/:Calla Soiled/:Dirty Nucleus/:07 もしも星屑が泣いたとして.mp3",
  :genre=>"",
  :label=>"",
  :playtime=>362.0,
  :release_date=>"2010/1/1",
  :bpm=>139.005,
  :key=>"11m",
  :musical_key=>"19",
  :cues=>
   [{:name=>"Beat Marker", :type=>4, :start=>434.042, :length=>0.0, :repeats=>-1, :hotcue=>-1},
    {:name=>"n.n.", :type=>4, :start=>434.042, :length=>0.0, :repeats=>-1, :hotcue=>0},
    {:name=>"n.n.", :type=>0, :start=>14246.2, :length=>0.0, :repeats=>-1, :hotcue=>1},
    {:name=>"n.n.", :type=>0, :start=>28058.7, :length=>0.0, :repeats=>-1, :hotcue=>2},
    {:name=>"n.n.", :type=>0, :start=>41871.4, :length=>0.0, :repeats=>-1, :hotcue=>3},
    {:name=>"n.n.", :type=>0, :start=>55683.6, :length=>0.0, :repeats=>-1, :hotcue=>4},
    {:name=>"n.n.", :type=>0, :start=>83308.5, :length=>0.0, :repeats=>-1, :hotcue=>5},
    {:name=>"n.n.", :type=>0, :start=>97121.0, :length=>0.0, :repeats=>-1, :hotcue=>6},
    {:name=>"n.n.", :type=>0, :start=>124746.0, :length=>0.0, :repeats=>-1, :hotcue=>7}]}]
```

## Notice

* Release date may be like `YYYY/1/1` when only YEAR is specified in file

## Contributing

1. Fork it ( https://github.com/polamjag/traktor-nml/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
