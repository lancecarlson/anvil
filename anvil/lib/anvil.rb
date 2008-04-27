%w(configuration console initializer version).each do |file|
  require File.join(File.dirname(__FILE__), "anvil", file)
end