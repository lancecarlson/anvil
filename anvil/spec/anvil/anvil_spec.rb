require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil do
  before do
    @toolkit = mock(Anvil::GUI::Toolkit)
    @app_path = File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
  end
  
  it "should launch the project" do
    Anvil::GUI::Toolkit.should_receive(:register!).and_return(@toolkit)
    Anvil.launch!
    Anvil.load_paths.should == { 
      :view=>["#{@app_path}/app/views", "**/*.rb"], 
      :application=>["#{@app_path}/app/controllers/application.rb", "**/*.rb"], 
      :log=>["#{@app_path}/log", "**/*.rb"], 
      :model=>["#{@app_path}/app/models", "**/*.rb"], 
      :controller=>["#{@app_path}/app/controllers", "**/*.rb"], 
      :config=>["#{@app_path}/config", "**/*.rb"] 
    }
  end
end