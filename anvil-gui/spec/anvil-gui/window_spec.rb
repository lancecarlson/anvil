require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe "The DSL for" do
  before do
    Anvil::GUI::Toolkit.register!("Fox")
    Anvil::GUI::Fox::Window.should_receive(:new).with([:test_window])
  end
  
  describe Anvil::GUI, "window" do      
    it "should be friggin cool" do
      Anvil::GUI.window :test_window do
        title "Hello World"
      end
    end
  end
end