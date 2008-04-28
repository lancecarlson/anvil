require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil::GUI::Fox::App do  
  it "should instantiate a new FXRuby app" do
    @app = Anvil::GUI::Fox::App.new
  end  
end