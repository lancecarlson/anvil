require File.join(File.dirname(__FILE__), "..", "spec_helper")

include Anvil::GUI

describe Anvil::GUI, "window" do  
  it "should create a new window with the default toolkit" do
    window "Test Window"
  end
end