require 'sqlite3'

class DatabaseConn
  Dir.mkdir("3rd_lab/Task 1/database_scripts") unless Dir.exist?("3rd_lab/Task 1/database_scripts")
  STRUCTURE_DIR = '3rd_lab/Task 1/database_scripts/structure_changes'
  DATA_DIR = '3rd_lab/Task 1/database_scripts/data_scripts'

  private_class_method :new

  @instance_mutex = Mutex.new

  def self.instance
    return @instance if @instance
    @instance_mutex.synchronize do
      @instance ||= new
    end
    @instance
  end

  def initialize
    @db = SQLite3::Database.new "3rd_lab/Task 1/students.db"
    @structure_dir = Dir.mkdir(STRUCTURE_DIR) unless File.exist?(STRUCTURE_DIR)
    @data_dir = Dir.mkdir(DATA_DIR) unless File.exist?(DATA_DIR)
    @manipulation = Students_list_DB.instance(@db)
  end

  def get_student_by_id(id)
    @manipulation.get_student_by_id(id)
  end
  def get_k_n_student_short_list(k, n)
    @manipulation.get_k_n_student_short_list(k, n)
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
    @db.execute <<-SQL
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

    structure_changes = File.new(File.join(STRUCTURE_DIR, 'create_student_table.sql'), 'w')
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
  def insert_data(data)
    @db.execute("INSERT INTO student (surname, name, patronymic, git, phone, email, telegram)
                  VALUES (?,?,?,?,?,?,?)", data)

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      INSERT INTO student (surname, name, patronymic, git, phone, email, telegram)
      VALUES (#{data});
    SQL
    puts 'Data inserted successfully!'
  end
  def select_data(id)
    row = @db.execute("SELECT * FROM student WHERE id = #{id}")
    puts row

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      SELECT * FROM student WHERE id = #{id};
    SQL
  end
end
