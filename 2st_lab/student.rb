# Создание класса
class Student
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
    !!(/^(\+7|7|8)?[\d]{10}$/ =~ phone)
  end
# Метод класса для проверки телефонного номера
# Используем его для проверки номера при установке значения атрибута phone
  def phone=(value)
    raise ArgumentError, "Неправильный формат номера телефона" unless self.class.phone_valid?(value)
    @phone = value
  end
end

