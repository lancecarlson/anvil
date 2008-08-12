%w(core_ext toolkit version window).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui", file)
end

module Anvil
  module GUI
    class << self
      def window(name, options = {}, &block)
        window = Window.new name
        window.instance_eval(&block) if block
      end
      
      def dsl(code_string)
        self.instance_eval(code_string) if code_string
      end
    end
  end
end