module Anvil
  module GUI
    class Window
      attr_accessor :properties
      
      def initialize(name)
        @toolkit = Toolkit
        @name = name
        @properties = {}
        @toolkit_object = create
        puts "#{@toolkit_object.inspect} Created"
      end
      
      def create
        @toolkit.window @name
      end
      
      def title=(title)
        # @properties[:title] = title
        @toolkit_object.title=(title)
      end
      
      def size=(width=640, height=480)
        if width.is_a?(Array)
          height = width[1]
          width = width[0]
        end
        
        # @properties[:size] = { :width => width, :height => height }
        @toolkit_object.resize(width, height)
      end
      
      def method_missing(method, *args)
        # @properties[method] = *args
        @toolkit_object.send(method, *args)
      end
      
      def button(name, options = {})
        @toolkit.button name
      end
    end
  end
end