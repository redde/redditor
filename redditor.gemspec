# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redditor/version'

Gem::Specification.new do |spec|
  spec.name          = "redditor"
  spec.version       = Redditor::VERSION
  spec.authors       = ["Oleg Bovykin", "Konstantin Gorozhankin"]
  spec.email         = ["oleg.bovykin@gmail.com", "konstantin.gorozhankin@gmail.com"]
  spec.description   = %q{Advanced page editor from redde}
  spec.summary       = %q{Page editor}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-core"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency 'generator_spec'

  spec.add_runtime_dependency "rails"
  spec.add_runtime_dependency "russian"
  spec.add_runtime_dependency "carrierwave"
end
