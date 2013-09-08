$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "redditor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "redditor"
  s.version       = Redditor::VERSION
  s.authors       = ["Oleg Bovykin", "Konstantin Gorozhankin"]
  s.email         = ["oleg.bovykin@gmail.com", "konstantin.gorozhankin@gmail.com"]
  s.description   = %q{Advanced page editor from redde}
  s.summary       = %q{Page editor}
  s.homepage      = "http://github.com/redde/redditor"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "carrierwave"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency 'generator_spec'
  s.add_development_dependency "factory_girl_rails"
end
