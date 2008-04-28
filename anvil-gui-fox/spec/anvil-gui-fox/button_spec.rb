require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil::GUI::Fox::Button do 
  before(:each) do
    @app = Anvil::GUI::Fox::App.new
    @window = Anvil::GUI::Fox::Window.new @app, "Hello World"
  end
  
  it "should instantiate a new FXRuby window" do
    Anvil::GUI::Fox::Button.new @window, "Hello World!!"
  end
  
  after(:each) do
    @app.run
  end
end