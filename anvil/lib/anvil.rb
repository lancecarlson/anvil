require "rubygems"
require "anvil-gui"
require "anvil-db"

%w(configuration console version).each do |file|
  require File.join(File.dirname(__FILE__), "anvil", file)
end

module Anvil
  class << self
    attr_accessor :environment, :root, :load_paths
    
    def launch!(argv=ARGV)
      @config = Configuration.new
      Anvil.environment = @config[:environment]
      Anvil.root = @config[:root]
      Launcher.new(@config)
    end
    
    def push_path(type, path, file_glob = "**/*.rb") 
      enforce!(type => Symbol)
      load_paths[type] = [path, file_glob]
    end
  
    def root_path(path)
      File.join(root, path)                         
    end
  end
end