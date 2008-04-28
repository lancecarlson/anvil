module Anvil
  module GUI
    class Dependency
      attr_reader :name
      
      def initialize(name)
        @name = name
      end

      def package
        "anvil-gui-#{@name.to_s.downcase}"
      end
      
      def constant
        eval "Anvil::GUI::#{@name}"
      end
      
      def exists?
        Anvil::GUI.const_defined?(@name)
      end
    end
  end
end