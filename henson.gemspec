# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "henson/version"

Gem::Specification.new do |gem|
  gem.name          = "henson"
  gem.version       = Henson::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Will Farrington"]
  gem.email         = ["wfarr@github.com"]
  gem.description   = %q{Bundler for Puppet modules.}
  gem.summary       = %q{Bundler for Puppet modules.}
  gem.homepage      = ""

  gem.required_ruby_version = ">= 1.8.7"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(acceptance|test|spec|features)/})
  gem.require_paths = ["lib"]

  # dependencies
  gem.add_dependency "faraday", "~> 0.7"
  gem.add_dependency "thor",    "~> 0.16.0"
  gem.add_dependency "multi_json"

  # development dependencies
  gem.add_development_dependency "mocha",     "~> 0.13.3"
  gem.add_development_dependency "rspec",     "~> 3"
  gem.add_development_dependency "simplecov", "~> 0.7.1"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "fakeweb"
end
