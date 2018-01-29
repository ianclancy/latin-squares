class Square
  attr_reader :rows
  def initialize(values)
    @values = values
    @rows = []
    @columns = []
    value_index = 0
    @values.each do |value|
      row_index = value_index / size
      column_index = value_index % size
      if column_index == 0
        @rows[row_index] = []
      end
      if row_index == 0
        @columns[column_index] = []
      end
      @rows[row_index] << value
      @columns[column_index] << value
      value_index += 1
    end
    @errors = []
  end

  def correct_number_of_values?
    if number_of_values == size
      return true
    else
      return false
    end
  end

  def error_message
    if number_of_values != size
      error_string = "there are a total of #{number_of_values} values used, but there should be #{size}."
    elsif !unique_rows?
      error_string = "the values in each row are not unique."
    elsif !unique_columns?
      error_string = "the values in each column are not unique."
    else
      error_string = ""
    end
    return error_string
  end

  def number_of_values
    return unique_values.length
  end

  def result
    if error_message.empty?
      return true
    else
      return false
    end
  end

  def size
    return Math.sqrt(@values.length).to_i
  end

  def unique_columns?
    @columns.each do |column|
      unique_column_values = []
      column.each do |value|
        if unique_column_values.include?(value)
          return false
        else
          unique_column_values << value
        end
      end
    end
    return true
  end

  def unique_rows?
    @rows.each do |row|
      unique_row_values = []
      row.each do |value|
        if unique_row_values.include?(value)
          return false
        else
          unique_row_values << value
        end
      end
    end
    return true
  end

  def unique_values
    list_of_values = []
    @values.each do |value|
      if !list_of_values.include?(value)
        list_of_values << value
      end
    end
    return list_of_values
  end
end
