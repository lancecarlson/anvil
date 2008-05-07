module Anvil
  module GUI
    class Initializer
      attr_reader :app, :toolkit
      
      def initialize(toolkit)
        @toolkit = initialize_toolkit(toolkit)
        check_existance
        @app = initialize_app
      end
      
      def check_existance
        unless @toolkit.exists?
          puts "#{@toolkit.name} is missing, please install the #{@toolkit.package} gem." 
          exit
        end
      end
      
      def initialize_toolkit(toolkit)
        Toolkit.new self, toolkit
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