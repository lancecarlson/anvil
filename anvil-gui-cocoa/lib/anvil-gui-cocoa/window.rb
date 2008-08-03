module Anvil
  module GUI
    module Cocoa      
      class Window
        attr_reader :real_object
        attr_accessor :title
        
        def initialize(name)
          @app = Toolkit.app
          @real_object = ::OSX::NSWindow.alloc.init
          @real_object.title = "Test"
          #show
        end
        
        def show
          @real_object.show
        end
      end
    end
  end
end