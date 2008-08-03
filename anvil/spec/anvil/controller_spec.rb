require File.join(File.dirname(__FILE__), "..", "spec_helper")

class ApplicationController < Anvil::Controller; end
class InitializationController < ApplicationController
  def show; end
end

describe Anvil::Controller do
  before do
    @events = mock(Anvil::Events)
    @toolkit = mock(Anvil::GUI::Toolkit)
    @app_path = File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
  end
  
  it "have some introspection methods" do
    InitializationController.controller_name.should == "initialization_controller"
    InitializationController.resource_name.should == "initialization"
  end
end