require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil::GUI::Qt::Window do   
  it "should instantiate a new Qt window" do
    @real_window = mock(Qt::Label)
    
    Qt::Label.should_receive(:new).with("Test", nil).and_return(@real_window)
    @real_window.should_receive(:show)
    
    Anvil::GUI::Qt::Window.new "Hello"
    @real_window.show
  end
end