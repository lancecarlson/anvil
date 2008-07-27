require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil do
  before do
    @toolkit = mock(Anvil::GUI::Toolkit)
  end
  
  it "should launch the project" do
    Anvil::GUI::Toolkit.should_receive(:new).and_return(@toolkit)
    Anvil.launch!
  end
end