delegateslib = File.join(File.dirname(__FILE__), "delegates")
 
Dir.glob("#{delegateslib}/*").each {|fn| require fn}