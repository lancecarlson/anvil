module Anvil
  module GUI
    class Initializer
      def initialize(toolkit)
        @toolkit = toolkit
        
        check_existance
        intialize_app
      end
      
      def check_existance
        dependency = Dependency.new @toolkit
        
        puts "#{dependency.name} is missing, please install the #{dependency.package} gem." unless dependency.exists?
      end
      
      def initialize_app
        "#{dependency.constant}::App"
      end
    end
  end
end