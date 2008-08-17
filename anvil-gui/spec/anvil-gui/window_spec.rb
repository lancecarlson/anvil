require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe "The DSL for" do
  before do
    @window = mock(Anvil::GUI::Window)
    Anvil::GUI::Toolkit.register!("Fox")
    Anvil::GUI::Fox::Window.should_receive(:new).with(:test_window).and_return(@window)
  end
  
  describe Anvil::GUI, "window" do      
    it "should be friggin cool" do
      @window.should_receive(:title=).with("Hello World")
      @window.should_receive(:resize).with(300, 400)
      @window.should_receive(:show)
      Anvil::GUI.window :test_window do |w|
        w.title = "Hello World"
        w.size = 300, 400
        w.show
      end
    end
  end
end