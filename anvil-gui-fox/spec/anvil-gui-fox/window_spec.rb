require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil::GUI::Fox::Window do 
  before(:each) do
    @app = Anvil::GUI::Fox::App.new
  end
  
  it "should instantiate a new FXRuby window" do
    Anvil::GUI::Fox::Window.new @app, "Hello"
  end
  
  after(:each) do
    @app.run
  end
end