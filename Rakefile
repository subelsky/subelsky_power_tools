#!/usr/bin/env ruby"

require "rubygems"
require "bundler"

desc "release"
task :release do
  require "./lib/subelsky_power_tools/version.rb"

  puts "Getting ready to tag and release #{SubelskyPowerTools::VERSION} - is this correct?"
  answer = $stdin.gets.chomp!

  exit if answer =~ /n/i

  `bundle`
  `git commit -ma "v#{SubelskyPowerTools::VERSION}"`
  `git tag '#{SubelskyPowerTools::VERSION}'`
  `git push origin '#{SubelskyPowerTools::VERSION}'`
  `gem build subelsky_power_tools.gemspec`
  `gem push subelsky_power_tools-#{SubelskyPowerTools::VERSION}.gem`
end
