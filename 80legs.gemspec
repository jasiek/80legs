# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eighty_legs/version'

Gem::Specification.new do |gem|
  gem.name          = "80legs"
  gem.version       = EightyLegs::VERSION
  gem.authors       = ["Jan Szumiec"]
  gem.email         = ["jan.szumiec@gmail.com"]
  gem.description   = "Provides a class for reading .80 files as delivered by 80legs."
  gem.summary       = "80legs' file format reader"
  gem.homepage      = "https://github.com/jasiek/80legs"

  gem.files         = Dir["{lib}/**/*.rb", "*.md", "LICENSE.txt"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"

  gem.required_ruby_version = "< 1.9"

  gem.add_development_dependency("rake")
  gem.add_development_dependency("shoulda")
end
