require File.join(File.dirname(__FILE__), "..", "spec_helper")

include Anvil::GUI
describe "The DSL for" do
  describe Anvil::GUI, "window" do  
    it "should be friggin cool" do
      window :test_window do
        title "Hello World"
        button "Click me!"
      end
    end
  end
end