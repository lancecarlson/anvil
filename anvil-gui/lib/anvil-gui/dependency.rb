module Anvil
  module GUI
    class Dependency      
      def initialize(name)
        @name = name
      end
      
      def name
        @name.to_s.capitalize
      end
      
      def package
        "anvil-gui-#{@name}"
      end
      
      def constant
        "Anvil::GUI::#{name}"
      end
      
      def exists?
        begin
          eval constant
          true
        rescue
          false
        end
      end
    end
  end
end