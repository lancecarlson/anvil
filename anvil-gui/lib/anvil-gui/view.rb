module Anvil
  module GUI
    def window(name, options = {}, &block)
      # Setting default GUI Toolkit to FOX for now. Need to change later
      toolkit_name = options[:toolkit] = :Fox
      initializer = initialize_toolkit(toolkit_name)
      window = Window.new initializer.toolkit, name
      window.instance_eval(&block) if block
      initializer.run_app
    end
    
    def load_gui_constant(toolkit, constant)
      eval("#{toolkit.constant}::#{constant}")
    end
    
    private
    def initialize_toolkit(toolkit)
      Initializer.new toolkit
    end
  end
end