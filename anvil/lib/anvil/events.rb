module Anvil
  module Events
    attr_reader :list
    
    class << self
      def setup
        @list = {}
        yield(EventBlock)
      end
      
      def key?(key)
        @list.key?(key)
      end
      
      def [](key)
        (@list||={})[key]
      end
      
      def []=(key,val)
        @list[key] = val
      end
      
      def fire_action!(controller_name, action_name)
        controller_klass = Controller.children[controller_name]
        raise StandardError, "Controller: #{controller_klass} does not exist" unless controller_klass
        controller = controller_klass.new
        raise StandardError, "Action :#{action_name} does not exist" unless controller.respond_to?(action_name)
        controller._run(action_name)
      end
    end
    
    class EventBlock
      class << self
        def method_missing(method, *args)
          params = args.first
          
          create_event(method, params[:controller], params[:action])
        end
        
        def create_event(name, controller, action)
          Anvil::Events[name] = { :controller => controller, :action => action }
        end
      end
    end
  end
end