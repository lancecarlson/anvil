require 'anvil-gui'
require 'fox16'

%w(app window button).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui-fox", file)
end