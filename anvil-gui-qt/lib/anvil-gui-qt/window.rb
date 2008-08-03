module Anvil
  module GUI
    module Qt      
      class Window
        attr_reader :real_object
        attr_accessor :title
        
        def initialize(name)
          @real_object = ::Qt::Label.new("Test", nil)
        end
        
        def title=(title)
        end
        
        def size=(width, height)
          @real_object.resize(width, height)
        end
        
        def text=(text)
          @real_object.setText(text)
        end
        
        def method_missing(method, *args)
          @real_object.send(method, *args)
        end
      end
    end
  end
end