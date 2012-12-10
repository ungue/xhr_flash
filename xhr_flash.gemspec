# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xhr_flash/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ungue"]
  gem.email         = ["javier.rodriguez@h1labs.com"]
  gem.summary       = "Flash object management in AJAX requests"
  gem.homepage      = "http://github.com/ungue/xhr_flash"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "xhr_flash"
  gem.require_paths = ["lib"]
  gem.version       = XhrFlash::VERSION

  gem.add_dependency "rails", '~> 3.1'
 
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rspec-rails"
end
