class Object
  # ==== Parameters
  # duck<Symbol>:: Check whether the Object respond_to?(duck)
  # duck<Class>:: Check whether the Object is_a?(duck)
  # duck<Array[Symbol, Class]>:: 
  #   Check whether it quacks_like? any of the options in the array
  def quacks_like?(duck)
    case duck
    when Symbol
      self.respond_to?(duck)
    when Class
      self.is_a?(duck)
    when Array
      duck.any? {|d| self.quacks_like?(d) }
    else
      false
    end
  end
end