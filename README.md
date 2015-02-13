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

## Contributing

1. Fork it ( https://github.com/polamjag/traktor-nml/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
