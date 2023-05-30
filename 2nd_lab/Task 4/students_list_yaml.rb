class Students_list_YAML < Superclass
  def initialize(file_path)
    @file_path = file_path
    @file_type = 'yaml'
    @students = []

    @students = self.class.read_from_file(@file_path, @file_type)
  end

  def save(new_students)
    self.class.write_to_file(@file_path, new_students, @file_type)
  end
end