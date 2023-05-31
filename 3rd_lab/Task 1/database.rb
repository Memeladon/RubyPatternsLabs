require 'sqlite3'

# создаем подключение к базе данных
db = SQLite3::Database.new 'test.db'

# выполняем SQL-запрос
db.execute 'CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)'

# закрываем подключение
db.close