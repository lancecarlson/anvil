%w(toolkit version window).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui", file)
end

module Anvil
  module GUI
    class << self
      def window(name, options = {}, &block)
        window = Window.new Toolkit, name
        window.instance_eval(&block) if block
      end
    end
  end
end