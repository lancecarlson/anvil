module Anvil
  module GUI
    def window(name, options = {})
      # Setting default GUI Toolkit to FOX for now. Need to change later
      toolkit_name = options[:toolkit] = :Fox
      toolkit = initialize_toolkit(toolkit_name)
      initialize_window(toolkit, name)
    end
    
    private
    def initialize_toolkit(toolkit)
      Initializer.new toolkit
    end
    
    def initialize_window(toolkit, name)
      eval("#{toolkit.dependency.constant}::Window").new toolkit.app, name
    end
  end
end