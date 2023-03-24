# Создание класса
class Student
# Геттер и сеттер
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github
# Инициализация с использованием атрибутов для упрощения написания
 def initialize(id:, last_name:, first_name:, middle_name: "", phone: "", telegram: "", email: "", github: "")
    self.id = id
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.github = github
  end
# Правильность номера телефона
  def phone_valid?
    !!(/^(\+7|7|8)?[\d]{10}$/ =~ @phone)
  end
end
