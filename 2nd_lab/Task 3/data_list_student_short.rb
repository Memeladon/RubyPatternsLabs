require_relative 'Data_list'

class Data_list_student_short < Data_list
  attr_accessor :data

  def get_names
    %w[surname_initials git contact]
  end

  def get_data(obj)
    [obj.surname_initials, obj.git, obj.contact]
  end

  private
  def format_data(data)
    super(data).map { |datum| datum.join(', ') }
  end
  def format_names(names)
    super(names).map { |name| name.capitalize }
  end
end