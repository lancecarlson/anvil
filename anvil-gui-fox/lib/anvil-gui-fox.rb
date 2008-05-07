require 'fox16'

%w(app window button).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui-fox", file)
end

require 'anvil-gui' unless Anvil::GUI.const_defined? "Initializer"