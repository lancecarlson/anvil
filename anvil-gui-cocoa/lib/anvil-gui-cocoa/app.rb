module Anvil
  module GUI
    module Cocoa      
      class App
        attr_reader :real_object
        def initialize
          # Ruby and Object C can now talk!
          OSX::NSApplication.sharedApplication
          @real_object = OSX::NSApp
          @real_object.setDelegate(Delegates::App.alloc.init)
        end
        
        def run
          @real_object.run
        end
        
        def exit
          OSX::NSApplication.sharedApplication.terminate(@real_object)
        end
      end
    end
  end
end