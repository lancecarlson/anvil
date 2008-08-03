require 'anvil-gui'
require 'osx/cocoa'

%w(app delegates version window).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui-cocoa", file)
end
