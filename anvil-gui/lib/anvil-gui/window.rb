module Anvil
  module GUI
    def window(name, options = {})
      # Setting default GUI Toolkit to FOX for now. Need to change later
      toolkit = options[:toolkit] = :fox
      initialize_toolkit(toolkit)
    end
    
    private
    def initialize_toolkit(toolkit)
      Initializer.new toolkit
    end
  end
end