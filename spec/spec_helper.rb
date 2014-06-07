$:.unshift(File.join(File.dirname(__FILE__),"..","lib"))
require "bundler/setup"
require "rspec"

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = :expect
  end
end
