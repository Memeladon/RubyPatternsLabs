require_relative '../Task 1/student'
require_relative '../Task 3/data_list'
require_relative '../Task 3/data_table'


data = [
  {ID: 1, Surname: "Pozov", Name: "Dmitry", Patronymic: "Temurovich", :"Phone number" => ["8-800-555-35-35"], Telegram: "pozov", Email: nil, GitHub: 'https://github.com/username/pozov'},
  {ID: 2, Surname: "Ivanov", Name: "Ivan", Patronymic: "Ivanovich", :"Phone number" => ["8-800-555-35-36", "8-800-555-35-37"], Telegram: "ivanov", Email: "ivanov@example.com", GitHub: 'https://github.com/username/ivanov'}
]

data_list = Data_list.new(data)
data_list.select(1)
data_list.select(2)
p data_list.get_selected
table = data_list.get_data
