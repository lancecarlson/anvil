module Anvil
  module GUI
    class Initializer
      attr_reader :app, :dependency
      
      def initialize(toolkit)
        @toolkit = toolkit
        @dependency = Dependency.new @toolkit
        
        check_existance
        
        @app = initialize_app
      end
      
      def check_existance
        unless @dependency.exists?
          puts "#{@dependency.name} is missing, please install the #{@dependency.package} gem." 
          exit
        end
      end
      
      def initialize_app
        load_gui_constant(@toolkit, "App").new
      end
      
      def run_app
        @app.run
      end
    end
  end
end