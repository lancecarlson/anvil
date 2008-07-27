module Anvil
  # To be cool, we use the launcher class. BootLoader and Initializer were taken (Merb/Rails)
  class Launcher
    def initialize(config)
      @config = config
      make_framework
    end
    
    def make_framework
    end
  end
end