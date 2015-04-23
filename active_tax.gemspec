# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_tax/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jamon Holmgren"]
  gem.email         = ["jamon@clearsightstudio.com"]
  gem.description   = "A Ruby gem for retrieving local sales tax rates from various government APIs. Currently only supports Washington State tax, but feel free to submit pull requests."
  gem.summary       = "A Ruby gem for retrieving local sales tax rates from various government APIs."
  gem.homepage      = "https://github.com/jamonholmgren/active_tax"
  gem.license       = "MIT"

  gem.platform     = Gem::Platform::RUBY

  gem.files         = `git ls-files`.split($\)
  # gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test)/})
  gem.name          = "active_tax"
  gem.require_paths = ["lib"]
  gem.version       = ActiveTax::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest"
  gem.add_development_dependency "minitest-reporters"
end
