module Anvil
  module GUI
    class Toolkit
      class << self
        attr_reader :name, :status, :app
      
        def register!(name)
          @name = name.to_s
          @status = :pending
          require_package
          check_existance
          build_application
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
          "Anvil::GUI::#{@name.capitalize}"
        end
      
        def exists?
          Anvil::GUI.const_defined?(@name)
        end
      
        def check_existance
          unless exists?
            raise "#{name} is missing, please install the #{package} gem." 
          end
        end
        
        def build_application
          @app = self.send(:app)
        end
      
        def method_missing(method, *args)
          eval("#{class_name}::#{method.to_s.capitalize}").new args
        end
      end
    end
  end
end