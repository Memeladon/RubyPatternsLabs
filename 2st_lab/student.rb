# Создание класса
class Student
# Геттер и сеттер
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github
# передаем в конструктор объект типа Hash и используем его для инициализации объекта
def initialize(**options)
  self.id = options[:id]
  self.last_name = options[:last_name]
  self.first_name = options[:first_name]
  self.middle_name = options[:middle_name] || ""
  self.phone = options[:phone] || ""
  self.telegram = options[:telegram] || ""
  self.email = options[:email] || ""
  self.github = options[:github] || ""
end
# Правильность номера телефона
  def phone_valid?
    !!(/^(\+7|7|8)?[\d]{10}$/ =~ @phone)
  end
end
