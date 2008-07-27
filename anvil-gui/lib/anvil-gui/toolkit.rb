module Anvil
  module GUI
    class Toolkit
      class << self
        attr_reader :name, :status
      
        def register!(name)
          @name = name.to_s
          @status = :pending
          require_package
          check_existance
        end
        
        def activate!
          @status = :active
        end

        def package
          "anvil-gui-#{@name.downcase}"
        end
      
        def require_package
          require package
        end
      
        def class_name
          (Anvil / GUI / @name.titleize).camel_case
        end
      
        def exists?
          Anvil::GUI.const_defined?(@name)
        end
      
        def check_existance
          unless exists?
            raise "#{name} is missing, please install the #{package} gem." 
          end
        end
      
        def method_missing(method, args)
          Object.instance_eval((class_name.to_const_path / method.titleize).camel_case).new args
        end
      end
    end
  end
end