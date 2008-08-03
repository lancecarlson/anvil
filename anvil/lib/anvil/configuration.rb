require "yaml"

module Anvil
  
  # Much of this class was shamelessly borrowed from Merb's configuration class.
  class Configuration
    class << self
      
      # Default configuration settings
      def defaults
        @defaults ||= {
          :environment    => "development",
          :anvil_root     => Dir.pwd,
          :toolkit_name        => "Qt" # Fox or Cocoa or Qt
        }
      end
      
      # Yields the configuration.
      #
      # ==== Block parameters
      # c<Hash>:: The configuration parameters.
      #
      # ==== Examples
      #   Anvil::Config.use do |config|
      #     config[:exception_details] = false
      #   end
      def use
        @configuration ||= {}
        yield @configuration
      end
      
      # ==== Parameters
      # key<Object>:: The key to check.
      #
      # ==== Returns
      # Boolean:: True if the key exists in the config.
      def key?(key)
        @configuration.key?(key)
      end
 
      # ==== Parameters
      # key<Object>:: The key to retrieve the parameter for.
      #
      # ==== Returns
      # Object:: The value of the configuration parameter.
      def [](key)
        (@configuration||={})[key]
      end
 
      # ==== Parameters
      # key<Object>:: The key to set the parameter for.
      # val<Object>:: The value of the parameter.
      def []=(key,val)
        @configuration[key] = val
      end
 
      # ==== Parameters
      # key<Object>:: The key of the parameter to delete.
      def delete(key)
        @configuration.delete(key)
      end
 
      # ==== Parameters
      # key<Object>:: The key to retrieve the parameter for.
      # default<Object>::
      #   The default value to return if the parameter is not set.
      #
      # ==== Returns
      # Object:: The value of the configuration parameter or the default.
      def fetch(key, default)
        @configuration.fetch(key, default)
      end
 
      # ==== Returns
      # Hash:: The config as a hash.
      def to_hash
        @configuration
      end
 
      # ==== Returns
      # String:: The config as YAML.
      def to_yaml
        @configuration.to_yaml  
      end
      
      # Sets up the configuration by storing the given settings.
      #
      # ==== Parameters
      # settings<Hash>::
      #   Configuration settings to use. These are merged with the defaults.
      def setup(settings = {})
        @configuration = defaults.merge(settings)
      end
      
      attr_accessor :configuration
      
      # Set configuration parameters from a code block, where each method
      # evaluates to a config parameter.
      #
      # ==== Parameters
      # &block:: Configuration parameter block.
      #
      # ==== Examples
      #   # Set environment and log level.
      #   Anvil::Config.configure do
      #     environment "development"
      #   end
      def configure(&block)
        ConfigBlock.new(self, &block) if block_given?
      end

      # Allows retrieval of single key config values via Anvil.config.<key>
      # Allows single key assignment via Anvil.config.<key> = ...
      #
      # ==== Parameters
      # method<~to_s>:: Method name as hash key value.
      # *args:: Value to set the configuration parameter to.
      def method_missing(method, *args) #:nodoc:
        if method.to_s[-1,1] == '='
          @configuration[method.to_s.tr('=','').to_sym] = *args
        else
          @configuration[method]
        end
      end
      
    end # class << self
    
    class ConfigBlock #:nodoc:

      def initialize(klass, &block) #:nodoc:
        @klass = klass
        instance_eval(&block)
      end

      def method_missing(method, *args) #:nodoc:
        @klass[method] = *args
      end

    end # ConfigBlock
    
  end # Config
end # Anvil