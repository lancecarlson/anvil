%w(initializer toolkit view window).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui", file)
end