$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "expansion/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "expansion"
  s.version     = Expansion::VERSION
  s.authors     = ["Adam Strickland"]
  s.email       = ["adam.strickland@gmail.com"]
  s.summary     = "expansion gem"
  s.description = "expansion gem"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
end
