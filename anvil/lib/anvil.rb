require "rubygems"
require "anvil-gui"
require "anvil-db"

%w(configuration console controller core_ext launcher version).each do |file|
  require File.join(File.dirname(__FILE__), "anvil", file)
end

module Anvil
  class << self
    attr_accessor :environment, :root, :load_paths, :toolkit_name
    
    def launch!(argv=ARGV)
      @config = Configuration.new
      Anvil.environment = @config[:environment]
      Anvil.root = @config[:root]
      Anvil.toolkit_name = @config[:toolkit_name]
      Launcher.new(@config)
    end
    
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
        Merb.root_path("log")
      end
    end
  end
end