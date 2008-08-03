module Anvil
  class Controller    
    def self.controller_name 
      @controller_name ||= self.name.to_const_path 
    end
       
    attr_accessor :action_name
    
    def controller_name
      self.class.controller_name
    end
    
    def _run(action)
      self.action_name = action
    end
    
    def render(action)
      
    end
  end
end