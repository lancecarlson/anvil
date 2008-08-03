require 'anvil-gui'
require 'qt'

%w(app version window).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui-qt", file)
end
