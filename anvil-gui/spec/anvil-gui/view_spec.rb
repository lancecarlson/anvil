require File.join(File.dirname(__FILE__), "..", "spec_helper")

include Anvil::GUI

describe Anvil::GUI, "window" do  
  it "should be friggin cool" do
    window "Test Window" do
      button "Click me!"
    end
  end
end