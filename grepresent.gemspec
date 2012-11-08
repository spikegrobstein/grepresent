# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grepresent/version'

Gem::Specification.new do |gem|
  gem.name          = "grepresent"
  gem.version       = Grepresent::VERSION
  gem.authors       = ["Spike Grobstein"]
  gem.email         = ["me@spike.cx"]
  gem.description   = %q{Format text using patterns and formatting rules on the commandline}
  gem.summary       = %q{Format text using patterns and formatting rules on the commandline}
  gem.homepage      = "https://github.com/spikegrobstein/grepresent"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'term-ansicolor'
  gem.add_dependency 'thor'
end
