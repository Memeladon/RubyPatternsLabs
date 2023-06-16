require 'sqlite3'

class Database

  def initialize
    @db = SQLite3::Database.new "students.db"
  end

  def cute
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
  end
end

Dir.mkdir("database_scripts") unless Dir.exist?("database_scripts")
