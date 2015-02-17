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
  :album=>"Green Night Parade EP",
  :primarykey=>
   "G:/:Music/:fu_mou/:Green Night Parade EP/:06 Green Night Parade (PandaBoY Remi.mp3",
  :genre=>"ALTEMA Records",
  :label=>"",
  :playtime=>371.0,
  :release_date=>"2011/1/1",
  :bpm=>131.999},
 {:title=>"Sweet Tear(Y calla K Cut Electro Remix)",
  :artist=>"Calla Soiled",
  :album=>"Sweet Tear EP",
  :primarykey=>
   "G:/:Music/:Calla Soiled/:Sweet Tear EP/:02 Sweet Tear(Y calla K Cut Electro.mp3",
  :genre=>"ALTEMA Records",
  :label=>"",
  :playtime=>320.0,
  :release_date=>"2010/1/1",
  :bpm=>132.0},
 {:title=>"もしも星屑が泣いたとして",
  :artist=>"Calla Soiled",
  :album=>"Dirty Nucleus",
  :primarykey=>"G:/:Music/:Calla Soiled/:Dirty Nucleus/:07 もしも星屑が泣いたとして.mp3",
  :genre=>"",
  :label=>"",
  :playtime=>362.0,
  :release_date=>"2010/1/1",
  :bpm=>139.005}]
```

## Contributing

1. Fork it ( https://github.com/polamjag/traktor-nml/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
