module Anvil
  module GUI
    module Fox      
      class Window
        attr_reader :real_object
        def initialize(app, name)
          @real_object = ::Fox::FXMainWindow.new app, name
          show
        end
        
        def show
          @real_object.show
        end
      end
    end
  end
end