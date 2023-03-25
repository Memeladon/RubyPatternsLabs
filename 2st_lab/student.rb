# Создание класса
class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :github

  # Валидации для полей
  validates :last_name, :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "Должны содержать только буквы" }
  validates :middle_name, :telegram, :email, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "Должны содержать только буквы, цифры и символ нижнего подчеркивания" }
  validates :github, :git_link, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "Должны содержать только буквы, цифры, символы нижнего подчеркивания и дефиса" }
 
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

# Метод validate для проверки наличия гита и контакта
  def validate
    validate_github_presence
    validate_contact_presence
  end

  def validate_github_presence
    errors.add(:github, "необходимо указать ссылку на Github") if github.blank?
  end

  def validate_contact_presence
    errors.add(:contact, "необходимо указать контакт для связи (телефон, телеграм или email)") if [phone, telegram, email].all?(&:blank?)
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

