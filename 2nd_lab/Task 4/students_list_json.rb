require_relative '../Task 4/strategy'
require_relative '../Task 4/superclass'

class Students_list_JSON < Strategy

  def read_students
    Superclass.read_from_file(@file_path, 'json')
  end

  def save_students(new_students)
    Superclass.write_to_file(@file_path, new_students, 'json')
  end
end
