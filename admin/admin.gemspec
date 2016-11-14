$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin"
  s.version     = Admin::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "http://www.xxx.com"
  s.summary     = "Admin section for Novum HMS."
  s.description = "Allows to do all administrative tasks"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0"

#  s.add_development_dependency "sqlite3"
  s.add_dependency 'godmin', '~> 1.3.0'
end
