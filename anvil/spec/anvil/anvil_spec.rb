require File.join(File.dirname(__FILE__), "..", "spec_helper")

class ApplicationController < Anvil::Controller; end
class InitializationController < ApplicationController
  def show; end
end

describe Anvil do
  before do
    @events = mock(Anvil::Events)
    @toolkit = mock(Anvil::GUI::Toolkit)
    @app_path = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "demos", "hello_world"))
  end
  
  it "should launch the project" do
    Anvil::Events.should_receive(:[]).with(:init).and_return({:controller => :initialization, :action => :show})
    Anvil::GUI::Toolkit.should_receive(:register!).and_return(@toolkit)
    Anvil.launch!
    Anvil.load_paths.should == { 
      :application=>["#{@app_path}/app/controllers/application.rb", "**/*.rb"], 
      :log=>["#{@app_path}/log", "**/*.rb"], 
      :model=>["#{@app_path}/app/models", "**/*.rb"], 
      :controller=>["#{@app_path}/app/controllers", "**/*.rb"], 
      :config=>["#{@app_path}/config", "**/*.rb"] 
    }
  end
end