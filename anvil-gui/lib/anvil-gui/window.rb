module Anvil
  module GUI
    class Window
      attr_accessor :properties
      
      def initialize(name)
        @toolkit = Toolkit
        @name = name
        @real_window = create
      end
      
      def create
        puts @real_window.inspect
        @toolkit.window @name
      end
      
      def title=(title)
        @properties[:title] = title
        @real_window.title=(title)
      end
      
      def size=(width, height)
        @properties[:size] = { :width => width, :height => height }
        @real_window.size = width, height
      end
      
      def method_missing(method, *args)
        @properties[method] = *args
        @real_window.send(method, *args)
      end
      
      def button(name, options = {})
        @toolkit.button name
      end
    end
  end
end