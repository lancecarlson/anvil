require "optparse"

require File.join(File.dirname(__FILE__), "anvil-gen", "application_generator")
require File.join(File.dirname(__FILE__), "anvil-gen", "console")

module Anvil
  module Generator
    TEMPLATE_DIR = File.join(File.dirname(__FILE__), "..", "templates")
  end
end