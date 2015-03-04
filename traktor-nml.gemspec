# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traktor/nml/version'

Gem::Specification.new do |spec|
  spec.name          = "traktor-nml"
  spec.version       = Traktor::NML::VERSION
  spec.authors       = ["polamjag"]
  spec.email         = ["s@polamjag.info"]
  spec.summary       = %q{Parse Native Instruments Traktor's nml playlist file}
  spec.description   = %q{Parse Native Instruments Traktor's nml playlist file}
  spec.homepage      = "https://github.com/polamjag/traktor-nml"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "oga"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
