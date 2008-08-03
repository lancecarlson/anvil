require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil::GUI::Qt::App do
  it "should instantiate a new Qt application" do
    Qt::Application.should_receive(:new).with(ARGV)
    @app = Anvil::GUI::Qt::App.new
  end
  
  it "should execute the Qt application" do
    @real_app = mock(Qt::Application)
    
    Qt::Application.should_receive(:new).with(ARGV).and_return(@real_app)
    @real_app.should_receive(:exec)
    
    @app = Anvil::GUI::Qt::App.new
    @app.run
  end
end