class Square
  attr_reader :rows
  def initialize(values)
    @values = values
    @rows = []
    value_index = 0
    @values.each do |value|
      row_index = value_index / length
      column_index = value_index % length
      if column_index == 0
        @rows[row_index] = []
      end
      @rows[row_index] << value
      value_index += 1
    end
  end

  def length
    Math.sqrt(@values.length).to_i
  end
end
