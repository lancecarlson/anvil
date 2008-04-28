module Anvil
  module GUI
    class Dependency
      attr_reader :name
      
      def initialize(name)
        @name = name
        require_package
      end

      def package
        "anvil-gui-#{@name.to_s.downcase}"
      end
      
      def require_package
        eval("require '#{package}'")
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