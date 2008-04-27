module Anvil
  module Generator
    # Anvil Generator console
    # 
    #   Anvil::Generator::Console.start(Dir.pwd, ARGV)
    class Console
      class << self
        
        def start(pwd, args)
          first, second = args.shift, args.shift
          
          pretend = "-p" ? true : false
          
          @generator = case first
          when "app" : ApplicationGenerator.new pwd, second, pretend
          when "model" : puts "Generate model"
          end
        end
        
      end # class << self  
    end # Console
    
  end # Generator
end # Anvil 