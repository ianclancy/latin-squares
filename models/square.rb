class Square
  attr_reader :rows
  def initialize(values)
    @values = values
    @rows = []
    value_index = 0
    @values.each do |value|
      row_index = value_index / size
      column_index = value_index % size
      if column_index == 0
        @rows[row_index] = []
      end
      @rows[row_index] << value
      value_index += 1
    end
  end

  def size
    Math.sqrt(@values.length).to_i
  end

  def correct_number_of_values?
    unique_values = []
    @values.each do |value|
      if !unique_values.include?(value)
        unique_values << value
      end
    end
    if unique_values.length == size
      return true
    else
      return false
    end
  end

  def result
    if correct_number_of_values?
      return true
    else
      return false
    end
  end
end
