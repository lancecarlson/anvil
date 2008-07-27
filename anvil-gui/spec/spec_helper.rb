# Ensure that only the source is getting tested and not the installed gem
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require "rubygems"
require "spec"

require File.join(File.dirname(__FILE__), "..", "lib", "anvil-gui")

Spec::Runner.configure do |config| 
end