class Data_table
  def initialize(data)
    @data = data
  end
  def get_element(row, col)
    @data[row][col]
  end
  def num_columns
    @data[0].length
  end
  def num_rows
    @data.length
  end
end