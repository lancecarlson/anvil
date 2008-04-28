module Anvil
  module GUI
    class Window
      def initialize(toolkit, name)
        @toolkit = toolkit
        @name = name
        @real_window = create
      end
      
      def create
        load_gui_constant(@toolkit, "Window").new @toolkit.app, @name
      end
      
      def button(name, options = {})
        load_gui_constant(@toolkit, "Button").new @real_window, name
      end
    end
  end
end