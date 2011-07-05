$:.unshift(File.dirname(__FILE__))
require 'lib/subelsky_power_tools/version'

Gem::Specification.new do |s|
  s.name = %q{subelsky_power_tools}
  s.version = SubelskyPowerTools::VERSION
  s.authors = ["Mike Subelsky"]
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.email = %q{mike@subelsky.com}
  s.extra_rdoc_files = %w(README.md)
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/subelsky/subelsky_power_tools}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{This is a collection of Ruby extensions and utilities I've been carting around from project to project.}
  s.description = <<-DESC
This is a collection of Ruby extensions and utilities I've been carting around from project to project. 
Many are taken from the Facets project (I just don't want to include that whole gem in my codebases).
DESC
  s.test_files = `git ls-files spec`.split("\n")
  s.add_development_dependency 'rspec'
  s.license = "MIT"
end
