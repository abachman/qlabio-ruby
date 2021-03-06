# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qlabio/version'

Gem::Specification.new do |spec|
  spec.name          = "qlabio-ruby"
  spec.version       = QLabIo::VERSION
  spec.authors       = ["Adam Bachman"]
  spec.email         = ["adam.bachman@gmail.com"]
  spec.description   = %q{A qlab.io helper.}
  spec.summary       = %q{A qlab.io helper.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'httparty', '0.13.5'
end
