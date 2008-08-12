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
      
      def resource_name
        controller_name.gsub("_controller", "")
      end
    end
       
    attr_accessor :action_name
    
    def controller_name
      self.class.controller_name
    end
    
    def resource_name
      self.class.resource_name
    end
    
    def _run(action)
      self.action_name = action
      self.send(action)
      render(action)
    end
    
    def render(action)
      Anvil::GUI.dsl open(_view_location(action)).readlines.join
    end
    
    private
    def _view_location(action)
      Anvil.view_path(resource_name, action) + ".rb"
    end
  end
end