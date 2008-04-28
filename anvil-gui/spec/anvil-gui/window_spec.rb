require File.join(File.dirname(__FILE__), "..", "spec_helper")

include Anvil::GUI

describe Anvil::GUI, "window" do  
  it "should display an error message if the dependency is missing" do
    window "Test Window"
  end
end