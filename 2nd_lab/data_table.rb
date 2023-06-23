class Data_table

  attr_accessor :table

  def initialize(table)
    self.table = table
  end

  def num_columns
    self.table[0].length
  end
  def num_rows
    self.table.length
  end

  def set_data(new_data)
    table = new_data.map.with_index do |row, i|
      row.map.with_index { |element, j| element.nil? ? get_element(i, j) : element }
    end
  end

  def printer
    self.table.each {|item| p item[0].to_s + ' ' + item[1].to_s + ' '}
  end
  def get_element(row, col)
    self.table[row][col]
  end

end