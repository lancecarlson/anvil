require "kissgen"

module Anvil
  module Generator
    class ApplicationGenerator
      def initialize(pwd, name, pretend = false)
        @pwd = pwd
        @name = name
        @pretend = pretend
        @generator = KISSGen::Generator.new File.join(TEMPLATE_DIR, "application"), File.join(@pwd, @name)
        
        generate
      end
      
      def generate
        @generator.directory "/"
        @generator.generate(:pretend => @pretend)
      end
      
      
    end # Application
  end # Generator
end # Anvil