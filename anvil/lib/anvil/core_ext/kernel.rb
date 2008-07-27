module Kernel
  # ==== Parameters
  # opts<Hash>:: A hash of options
  #
  # ==== Options
  # *keys<Object>:: A list of objects to type-check
  # *values<Symbol, Class, Array[(Symbol, Class)]>::
  # * If it's a symbol, check whether the object responds to the symbol
  # * If it's a class, check whether it is_a? of the class
  # * If it's an array, check whether the above check is true for any of
  #   the options
  def enforce!(opts = {})
    opts.each do |k,v|
      raise ArgumentError, "#{k.inspect} doesn't quack like #{v.inspect}" unless k.quacks_like?(v)
    end
  end
end