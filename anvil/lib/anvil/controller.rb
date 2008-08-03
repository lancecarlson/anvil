module Anvil
  class Controller
    class << self
      attr_accessor :children
      
      def inherited(subclass)
        @children ||= {}
        Anvil::Controller.children[subclass.to_s.underscore.to_sym] = subclass
      end
    
      def controller_name
        @controller_name ||= self.name.to_const_path 
      end
    end
       
    attr_accessor :action_name
    
    def controller_name
      self.class.controller_name
    end
    
    def _run(action)
      self.action_name = action
      self.send(action)
      render(action)
    end
    
    def render(action)
      
    end
  end
end