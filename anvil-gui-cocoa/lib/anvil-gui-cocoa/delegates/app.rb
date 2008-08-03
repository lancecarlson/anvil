module Anvil
  module GUI
    module Cocoa
      module Delegates
        class App < OSX::NSObject          
          def applicationDidFinishLaunching(notification)
            Anvil::GUI::Cocoa::Window.new "Hello"
          end
          
          def applicationWillFinishLaunching(notification)
          end
          
        end
      end
    end
  end
end