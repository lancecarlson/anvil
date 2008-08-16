module Anvil
  module GUI
    class Toolkit
      class << self
        attr_reader :name, :status
      
        def register!(name)
          @name = name.to_s
          @status = :pending
          require_package
          check_existence
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
      
        def check_existence
          unless exists?
            raise "#{name} is missing, please install the #{package} gem." 
          end
        end
        
        def build_application
          puts "Starting #{name} Toolkit"
          @app = self.app
        end
        
        def run
          @app.run
        end
      
        def method_missing(method, *args)
          gui_klass = "#{class_name}::#{method.to_s.capitalize}"
          puts "#{gui_klass} Accessed"
          eval(gui_klass).new *args
        end
      end
    end
  end
end