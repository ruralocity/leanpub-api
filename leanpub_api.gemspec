# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leanpub_api/version'

Gem::Specification.new do |spec|
  spec.name          = "leanpub_api"
  spec.version       = LeanpubAPI::VERSION
  spec.authors       = ["Aaron Sumner"]
  spec.email         = ["asumner@mac.com"]
  spec.description   = %q{A simple Ruby wrapper for the Leanpub API.}
  spec.summary       = %q{A simple Ruby wrapper for the Leanpub API. Not affiliated with Leanpub or Ruboss Technology Corporation.}
  spec.homepage      = "https://github.com/ruralocity/leanpub-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", '~> 0.12.0', '>= 0.12.0'

  spec.add_development_dependency "bundler", '~> 1.3'
  spec.add_development_dependency "rake", '~> 10.1', '>= 10.1.1'
  spec.add_development_dependency "webmock", '~> 1.14', '>= 1.14.0'
  spec.add_development_dependency "vcr", '~> 2.6', '>= 2.6.0'
  spec.add_development_dependency "dotenv", '~> 0.9', '>= 0.9.0'
end
