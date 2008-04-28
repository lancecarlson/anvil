module Anvil
  module GUI
    module Fox      
      class Window
        attr_reader :real_object, :app
        def initialize(app, name)
          @app = app
          @real_object = ::Fox::FXMainWindow.new app.real_object, name
          show
        end
        
        def show
          @real_object.show
        end
      end
    end
  end
end