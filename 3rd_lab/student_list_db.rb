require_relative 'database_manipulation'

class Student_list_DB
  def initialize
    @db_obj = SQLite3::Database.new "3rd_lab/student.db"
    @db_obj.results_as_hash = true
    @manipulation = DatabaseManipulation.instance(@db_obj)
  end

  def get_student_by_id(id)
    row = @manipulation.get_student_by_id(id)
    p Student.new(row[0])
  end
  def get_k_n_student_short_list(k, n)
    data = @manipulation.get_k_n_student_short_list(k, n)
    students = []
    data.each { |row| students << Student_short.new(row['id'], row.except('id')) }
    Data_list.new(students)

  end
  def add_student(student)
    @manipulation.add_student(student)
  end
  def replace_student(student)
    @manipulation.replace_student(student)
  end
  def delete_student(id)
    @manipulation.delete_student(id)
  end
  def count_students
    @manipulation.count_students
  end
  def get_all_students
    @manipulation.get_all_students
  end
  def create_table
    @manipulation.create_table
  end
end
