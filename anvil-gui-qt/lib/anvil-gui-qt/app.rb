module Anvil
  module GUI
    module Qt      
      class App
        attr_reader :real_object
        def initialize
          @real_object = ::Qt::Application.new(ARGV)
        end
        
        def run
          @real_object.exec
        end
        
        def exit
          @real_object.exit
        end
      end
    end
  end
end