# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mksite/version'

Gem::Specification.new do |gem|
  gem.name          = "mksite"
  gem.version       = Mksite::VERSION
  gem.authors       = ["David Albert"]
  gem.email         = ["davidbalbert@gmail.com"]
  gem.description   = %q{A static site generator}
  gem.summary       = %q{A static site generator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'docopt'
  gem.add_runtime_dependency 'sprockets'
end
