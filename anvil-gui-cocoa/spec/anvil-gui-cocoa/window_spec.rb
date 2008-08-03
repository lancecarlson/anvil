require File.join(File.dirname(__FILE__), "..", "spec_helper")

@app = Anvil::GUI::Cocoa::App.new

describe Anvil::GUI::Cocoa::Window do   
  it "should instantiate a new Ruby Cocoa window" do
    # Anvil::GUI::Cocoa::Window.new "Hello"
  end
end

@app.run
# @app.close