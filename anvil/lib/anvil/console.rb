require 'optparse'

module Anvil
  class Console
    class << self
      def parse_args(argv = ARGV)
        @configuration ||= {}
        # Our primary configuration hash for the length of this method
        options = {}

        # Environment variables always win
        options[:environment] = ENV['ANVIL_ENV'] if ENV['ANVIL_ENV']

        # Build a parser for the command line arguments
        opts = OptionParser.new do |opts|
          opts.version = Anvil::VERSION

          opts.banner = "Usage: anvil [IailLerkKX] [argument]"
          opts.define_head "Anvil: The Desktop Application Framework"
          opts.separator '*'*80
          opts.separator "If no flags are given, Anvil starts up with the #{Anvil::Configuration.defaults[:toolkit_name]} toolkit"
          opts.separator '*'*80

          opts.on("-I", "--init-file FILE", "Name of the file to load first") do |init_file|
            options[:init_file] = init_file
          end

          opts.on("-a", "--anvil-root /path/to/approot", "The path to the Anvil.root for the app you want to run (default is current working dir).") do |root|
            options[:anvil_root] = File.expand_path(root)
          end

          opts.on("-i", "--irb-console", "This flag will start anvil in irb console mode. All your models and other classes will be available for you in an irb session.") do |console|
            options[:adapter] = 'irb'
          end

          opts.on("-l", "--log-level LEVEL", "Log levels can be set to any of these options: debug < info < warn < error < fatal") do |log_level|
            options[:log_level] = log_level.to_sym
          end

          opts.on("-L", "--log LOGFILE", "A string representing the logfile to use.") do |log_file|
            options[:log_file] = log_file
          end

          opts.on("-e", "--environment STRING", "Run anvil in the correct mode(development, production, testing)") do |env|
            options[:environment] = env
          end

          opts.on("-D", "--debugger", "Run anvil using rDebug.") do
            begin
              require 'ruby-debug'
              Debugger.start
              Debugger.settings[:autoeval] = true if Debugger.respond_to?(:settings)
              puts "Debugger enabled"
            rescue LoadError
              puts "You need to install ruby-debug to run the server in debugging mode. With gems, use 'gem install ruby-debug'"
              exit
            end
          end

          opts.on("-?", "-H", "--help", "Show this help message") do
            puts opts  
            exit
          end
        end

        # Parse what we have on the command line
        opts.parse!(argv)
        Anvil::Configuration.setup(options)
      end
    end
  end
end