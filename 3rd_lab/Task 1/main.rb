require_relative 'database'


db = Database.new
db.create_table
db.insert_data(['Ivanov', 'Ivan', 'Ivanovich', 'ivanov_ivan', '+7 (999) 123-45-67', 'ivanov_ivan@mail.ru', '@ivan456'])