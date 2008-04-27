require 'fox16'

%w(window).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui-fox", file)
end