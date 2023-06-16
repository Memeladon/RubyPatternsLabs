require_relative '../Task 4/strategy'
require_relative '../Task 4/student_list'

class Students_list_JSON < Strategy

  # a. Метод чтения из файла
  def read_students
    students = []

    data = []
    File.open(@file_path, 'r') do |file|
      students_json = file.read
      data = JSON.parse(students_json)
    end

    data.each do |student_data|
      students << Student.new(student_data)
    end

    students
  end

  # b. Метод записи в файл
  def self.save_students(students)
    students_array = []
    students.each do |student|
      students_array << student.to_s
    end

    File.open(@file_path, 'w') do |file|
      file.write(data.to_json)
    end
  end
end
