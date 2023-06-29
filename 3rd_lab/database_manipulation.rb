require 'sqlite3'
require 'thread'
require_relative '../2nd_lab/student'
require_relative '../2nd_lab/student_short'
require_relative '../2nd_lab/data_list'
require_relative '../3rd_lab/modules/dirs'

class DatabaseManipulation
  include DIRS

  #------------------- Singlenton ----------------------------------------------------------------------------------- #
  private_class_method :new

  @instance_mutex = Mutex.new

  def self.instance(db)
    return @instance if @instance
    @instance_mutex.synchronize do
      @instance ||= new(db)
    end
    @instance
  end
  # ----------------------------------------------------------------------------------------------------------------- #

  def initialize(db)
    @db_obj = db
  end

  def create_table
    @db_obj.execute <<-SQL
    CREATE TABLE IF NOT EXISTS student (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      surname TEXT NOT NULL,
      name TEXT NOT NULL,
      patronymic TEXT NOT NULL,
      git TEXT,
      phone TEXT,
      email TEXT,
      telegram TEXT
    );
    SQL

    structure_changes = File.open(File.join(STRUCTURE_DIR, 'create_student_table.sql'), 'w')
    structure_changes.puts <<-SQL
    CREATE TABLE IF NOT EXISTS student (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      surname TEXT NOT NULL,
      name TEXT NOT NULL,
      patronymic TEXT NOT NULL,
      git TEXT,
      phone TEXT,
      email TEXT,
      telegram TEXT
    );
    SQL

    puts 'Student table created successfully!'
  end
  def get_student_by_id(id)
    data_script = File.open(File.join(DATA_DIR, 'insert_students_data.sql'), 'a')
    data_script.puts <<-SQL
      SELECT * FROM student WHERE id = #{id};
    SQL

    @db_obj.execute("SELECT * FROM student WHERE id = ?", id)
  end
  def get_k_n_student_short_list(k, n)
    data_script = File.open(File.join(DATA_DIR, 'insert_students_data.sql'), 'a')
    data_script.puts <<-SQL
      SELECT * FROM student LIMIT #{(k-1)*n}, #{n};
    SQL

    @db_obj.execute("SELECT * FROM student LIMIT ?, ?", [(k-1)*n, n])
  end
  def add_student(student)
    @db_obj.execute("INSERT INTO student (surname, name, patronymic, git, phone, email, telegram) VALUES (?, ?, ?, ?, ?, ?, ?)",
                    student.surname, student.name, student.patronymic, student.git, student.phone, student.email, student.telegram)

    File.open(File.join(DATA_DIR, 'insert_students_data.sql'), 'a') do |data_script|
      data_script.puts("INSERT INTO student (surname, name, patronymic, git, phone, email, telegram) VALUES (#{student.surname}, #{student.name}, #{student.patronymic}, #{student.git}, #{student.phone}, #{student.email}, #{student.telegram}");
    end

    puts "Data added successfully!"
  end
  def replace_student(student)
    @db_obj.execute("UPDATE student SET surname = ?, name = ?, patronymic = ?, git = ?, phone = ?, email = ?, telegram = ? WHERE id = ?",
                    student.surname, student.name, student.patronymic, student.git, student.phone, student.email, student.telegram, student.id)

    File.open(File.join(DATA_DIR, 'insert_students_data.sql'), 'a') do |data_script|
      data_script.puts("UPDATE student SET surname = ?, name = ?, patronymic = ?, git = ?, phone = ?, email = ?, telegram = ? WHERE id = ?, #{student.surname}, #{student.name}, #{student.patronymic}, #{student.git}, #{student.phone}, #{student.email}, #{student.telegram}, #{student.id}");
    end

    puts "Data replaced successfully!"
  end
  def delete_student(id)
    @db_obj.execute("DELETE FROM student WHERE id = ?", id)

    File.open(File.join(DATA_DIR, 'insert_students_data.sql'), 'a') do |data_script|
      data_script.puts("DELETE FROM student WHERE id = #{id}");
    end

    puts "Data deleted successfully!"
  end
  def count_students
    data_script = File.open(File.join(DATA_DIR, 'insert_students_data.sql'), 'a')
    data_script.puts <<-SQL
      SELECT COUNT(id) FROM student;
    SQL

    @db_obj.get_first_value("SELECT COUNT(id) FROM student").to_i
  end
  def get_all_students
    data_script = File.open(File.join(DATA_DIR, 'insert_students_data.sql'), 'a')
    data_script.puts <<-SQL
      SELECT * FROM student;
    SQL
    @db_obj.execute('SELECT * FROM student')
  end
end
