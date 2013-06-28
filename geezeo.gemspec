# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "geezeo/version"

Gem::Specification.new do |spec|
  spec.name          = "geezeo"
  spec.version       = Geezeo::VERSION
  spec.authors       = ["Fuzz Leonard"]
  spec.email         = ["fuzz@fuzzleonard.com"]
  spec.description   = %q{A simple Ruby wrapper for the Geezeo API}
  spec.summary       = %q{A simple Ruby wrapper for the Geezeo API. Sandbox Edition.}
  spec.homepage      = "https://github.com/fuzz/geezeo"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "json"
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
