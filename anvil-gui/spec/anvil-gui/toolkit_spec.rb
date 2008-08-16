require File.join(File.dirname(__FILE__), "..", "spec_helper")

module Anvil::GUI::Fox
  class App
  end
end

describe Anvil::GUI::Toolkit do
  before do
    @fox = mock(Anvil::GUI::Fox::App)
    Anvil::GUI::Toolkit.should_receive(:require).with("anvil-gui-fox").and_return(true)
    Anvil::GUI::Fox::App.should_receive(:new).and_return(@fox)
    Anvil::GUI::Toolkit.register! :Fox
  end
  
  it "it should have the toolkit name" do
    Anvil::GUI::Toolkit.name.should == "Fox"
  end
end