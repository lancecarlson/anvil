%w(initializer toolkit view window).each do |file|
  require File.join(File.dirname(__FILE__), "anvil-gui", file)
end

module Anvil
  module GUI
    def window(name, options = {}, &block)
      # Setting default GUI Toolkit to FOX for now. Need to change later
      toolkit_name = options[:toolkit] = :Fox
      launch = launch_toolkit(toolkit_name)
      window = Window.new launcher.toolkit, name
      window.instance_eval(&block) if block
      launch.run_app
    end
    
    def load_gui_constant(toolkit, constant)
      eval("#{toolkit.constant}::#{constant}")
    end
    
    private
    def launch_toolkit(toolkit)
      Launcher.new toolkit
    end
  end
end