module Anvil
  module GUI
    class Window
      def initialize(name)
        @toolkit = Toolkit
        @name = name
        @real_window = create
      end
      
      def create
        @toolkit.window @name
      end
      
      def title(title)
      end
      
      def size(width, height)
      end
      
      def button(name, options = {})
        @toolkit.button name
      end
    end
  end
end