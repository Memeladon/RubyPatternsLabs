require_relative 'strategy'
require_relative 'student_list'
class Students_list_YAML < Strategy

  # a. Метод чтения из файла
  def read_students
    students = []

    data = YAML.load_file(@file_path)

    data.each do |student_data|
      students << Student.new(student_data)
    end

    students
  end

  # b. Метод записи в файл
  def save_students(students)
    students_array = []
    students.each do |student|
      students_array << student.to_s
    end

    File.open(@file_path, 'w') do |file|
      file.write(data.to_yaml)
    end
  end

  private
end