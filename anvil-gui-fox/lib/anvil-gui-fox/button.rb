module Anvil
  module GUI
    module Fox      
      class Button
        attr_reader :real_object, :window
        def initialize(window, name)
          @window = window
          @real_object = ::Fox::FXButton.new window.real_object, name
        end
      end
    end
  end
end