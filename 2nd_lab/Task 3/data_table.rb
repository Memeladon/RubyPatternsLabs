class Data_table
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def set_data(new_data)
    @data = new_data.map.with_index do |row, i|
      row.map.with_index { |element, j| element.nil? ? get_element(i, j) : element }
    end
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