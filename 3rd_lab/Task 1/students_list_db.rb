# require 'singleton'
require_relative 'database_conn'
require_relative '../../2nd_lab/Task 2/student_short'
require_relative '../../2nd_lab/Task 1/student'
require_relative '../../2nd_lab/Task 3/data_list'

class Students_list_DB
  Dir.mkdir("3rd_lab/Task 1/database_scripts") unless Dir.exist?("3rd_lab/Task 1/database_scripts")
  STRUCTURE_DIR = '3rd_lab/Task 1/database_scripts/structure_changes'
  DATA_DIR = '3rd_lab/Task 1/database_scripts/data_scripts'

  private_class_method :new

  @instance_mutex = Mutex.new

  def self.instance(db_obj)
    return @instance if @instance
    @instance_mutex.synchronize do
      @instance ||= new(db_obj)
    end
    @instance
  end

  def initialize(db_obj)
    @db = db_obj
  end

  def get_student_by_id(id)
    row = @db.select_data(id)
    Student.new(id: row[0], surname: row[1], name: row[2],
                    patronymic: row[3], git: row[4], phone: row[5],
                    email: row[6], telegram: row[7])
  end
  def get_k_n_student_short_list(k, n)
    students = []
    @db.execute("SELECT * FROM student LIMIT ?, ?", [(k-1)*n, n]) do |row|
      id, info = row
      students << Student_short.new(id, info)
    end
    Data_list.new(students)
  end
  def add_student(student)
    @db.execute("INSERT INTO student (surname, name, patronymic, git, phone, email, telegram) VALUES (?, ?, ?, ?, ?, ?, ?)", student)

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      INSERT INTO student (surname, name, patronymic, git, phone, email, telegram) VALUES (?, ?, ?, ?, ?, ?, ?), #{student}
    SQL
  end
  def replace_student(student)
    @db.execute("UPDATE student SET surname = ?, name = ?, patronymic = ?, git = ?, phone = ?, email = ?, telegram = ? WHERE id = ?",
                student.surname, student.name, student.patronymic, student.git, student.phone, student.email, student.telegram, student.id)

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      UPDATE student SET surname = ?, name = ?, patronymic = ?, git = ?, phone = ?, email = ?, telegram = ? WHERE id = ?,
                #{student.surname}, #{student.name}, #{student.patronymic}, #{student.git}, #{student.phone}, #{student.email}, #{student.telegram}, #{student.id}
    SQL
    puts "Data replaced successfully!"
  end
  def delete_student(id)
    @db.execute("DELETE FROM student WHERE id = ?", id)

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      DELETE FROM student WHERE id = ?", #{id}
    SQL

    puts "Data deleted successfully!"
  end
  def count_students
    count = @db.get_first_value("SELECT COUNT(id) FROM student").to_i

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      SELECT COUNT(id) FROM student
    SQL
    count
  end
  def get_all_students
    data = @db.execute('SELECT * FROM student')

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      SELECT * FROM student
    SQL
    puts data
  end
end