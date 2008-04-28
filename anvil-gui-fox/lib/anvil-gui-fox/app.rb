module Anvil
  module GUI
    module Fox      
      class App
        attr_reader :real_object
        def initialize
          @real_object = ::Fox::FXApp.new
        end
        
        def run
          @real_object.run
        end
      end
    end
  end
end