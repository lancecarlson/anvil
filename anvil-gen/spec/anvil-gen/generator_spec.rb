require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Anvil::Generator::Console do  
  it "should generate a new anvil application" do
    @g = Anvil::Generator::Console.start(Dir.pwd, ["app", "new_anvil_app", true])
  end
end