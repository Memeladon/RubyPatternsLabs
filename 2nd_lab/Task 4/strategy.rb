class Strategy
  attr_reader :file_path
  def initialize(file_path)
    @file_path = file_path
  end

  def read_students
    raise 'Not implemented'
  end

  def save_students(new_students)
    raise 'Not implemented'
  end
end
