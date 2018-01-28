class Square
  def initialize(values)
    @values = values
  end

  def length
    Math.sqrt(@values.length)
  end
end
