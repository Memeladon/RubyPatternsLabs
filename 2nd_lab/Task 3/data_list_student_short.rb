require_relative 'Data_list'
require_relative 'Data_table'

class Data_list_student_short < Data_list
  public_class_method :new

  attr_accessor :data

  def initialize(data)
    super
  end

  def get_names
    %w[surname_initials git contact]
  end

  def get_data
    student_data = self.data_list.map.with_index do |student, i|
      [i+1] + get_names.map { |attr| student.send(attr.to_sym) }
    end
    Data_table.new(student_data)
  end

  private
  def format_data(data)
    super(data).map { |datum| datum.join(', ') }
  end
  def format_names(names)
    super(names).map { |name| name.capitalize }
  end
end