require 'sqlite3'

class Database

  Dir.mkdir("3rd_lab/Task 1/database_scripts") unless Dir.exist?("3rd_lab/Task 1/database_scripts")

  STRUCTURE_DIR = '3rd_lab/Task 1/database_scripts/structure_changes'
  DATA_DIR = '3rd_lab/Task 1/database_scripts/data_scripts'

  def initialize
    @db = SQLite3::Database.new "3rd_lab/Task 1/students.db"
    @structure_dir = Dir.mkdir(STRUCTURE_DIR) unless File.exist?(STRUCTURE_DIR)
    @data_dir = Dir.mkdir(DATA_DIR) unless File.exist?(DATA_DIR)
  end

  def create_table
    @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS student (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      surname TEXT,
      name TEXT,
      patronymic TEXT,
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
      surname TEXT,
      name TEXT,
      patronymic TEXT,
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
  def select_all_data
    rows = @db.execute('SELECT * FROM student')
    puts rows

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      SELECT * FROM student
    SQL
  end
  def select_student(id)
    row = @db.execute("SELECT * FROM student WHERE id = #{id}")
    puts row

    data_script = File.new(File.join(DATA_DIR, 'insert_students_data.sql'), 'w')
    data_script.puts <<-SQL
      SELECT * FROM student WHERE id = #{id};
    SQL
  end
end
