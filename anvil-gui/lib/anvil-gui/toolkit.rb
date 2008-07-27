module Anvil
  module GUI
    class Toolkit
      attr_reader :name
      
      def initialize(name)
        @name = name.to_s
        check_existance
        require_package
      end

      def package
        "anvil-gui-#{@name.downcase}"
      end
      
      def require_package
        require package
      end
      
      def constant
        eval "Anvil::GUI::#{@name}"
      end
      
      def exists?
        Anvil::GUI.const_defined?(@name)
      end
      
      def check_existance
        unless exists?
          raise "#{name} is missing, please install the #{package} gem." 
        end
      end
    end
  end
end