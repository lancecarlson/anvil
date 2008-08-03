require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil::Events do  
  it "should launch the project" do
    Anvil::Events.setup do |e|
      e.init :controller => :tests, :action => :show
      e.open_file :controller => :files, :action => :edit
    end
    Anvil::Events[:init].should == { :controller => :tests, :action => :show }
  end
end