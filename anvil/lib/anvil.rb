require "rubygems"
require "anvil-gui"
require "anvil-db"

%w(configuration console controller core_ext events launcher version).each do |file|
  require File.join(File.dirname(__FILE__), "anvil", file)
end

module Anvil
  class << self
    attr_accessor :environment, :root, :load_paths, :toolkit_name
    
    def launch!(argv=ARGV)
      if argv === Hash
        @config = Configuration.setup(argv)
      else
        @config = Console.parse_args(argv)
      end
      Anvil.environment = @config[:environment]
      Anvil.root = @config[:anvil_root]
      Anvil.toolkit_name = @config[:toolkit_name]
      Launcher.new(@config)
    end
    
    Anvil.load_paths = Hash.new { [Anvil.root] } unless Anvil.load_paths.is_a?(Hash)
    
    def push_path(type, path, file_glob = "**/*.rb") 
      enforce!(type => Symbol)
      load_paths[type] = [path, file_glob]
    end
  
    def root_path(path)
      File.join(root, path)
    end
    
    def log_path
      if @config[:log_file]
        File.dirname(@config[:log_file])
      else
        Anvil.root_path("log")
      end
    end
    
    def view_path(resource, action)
      Anvil.root_path("app/views/#{resource}/#{action}")
    end
  end
end