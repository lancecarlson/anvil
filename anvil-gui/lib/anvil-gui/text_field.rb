module Anvil
  module GUI
    class TextField
      attr_accessor :text
      
      def initialize(toolkit)
        @toolkit = toolkit
        @name = name
        @real_window = create
      end
      
      def create
        load_gui_constant(@toolkit, "TextField").new @toolkit.initializer.app, @name
      end
      
      def button(name, options = {})
        load_gui_constant(@toolkit, "Button").new @real_window, name
      end
    end
  end
end