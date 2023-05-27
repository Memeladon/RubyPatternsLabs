class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(args = {})
    @id = args[:id]
    @surname = args[:surname] || ''
    @name = args[:name] || ''
    @patronymic = args[:patronymic] || ''

    raise ArgumentError, 'Invalid surname' unless Student.valid_surname?(@surname)
    raise ArgumentError, 'Invalid name' unless Student.valid_name?(@name)
    raise ArgumentError, 'Invalid patronymic' unless Student.valid_patronymic?(@patronymic)

    @phone = args[:phone] || ''
    @telegram = args[:telegram] || ''
    @email = args[:email] || ''
    @git = args[:git] || ''

    raise ArgumentError, 'Invalid git' unless Student.valid_git?(@git)

  end

  def validate
    raise ArgumentError, 'No contact information provided' if !@phone && !@telegram && !@email
    raise ArgumentError, 'No GitHub provided' unless @git
  end

  def set_contacts(phone: '', telegram: '', email: '')
    @phone = phone if Student.valid_phone_number?(phone)
    @telegram = telegram if Student.valid_telegram?(telegram)
    @email = email if Student.valid_email?(email)
  end

  def self.valid_phone_number?(phone)
    phone.to_s.match?(/^(\+)?((\d{2,3}) ?\d|\d)(([ -]?\d)|( ?(\d{2,3}) ?)){5,12}\d$/)
  end

  def self.valid_name?(name)
    name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end

  def self.valid_surname?(surname)
    surname.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end

  def self.valid_patronymic?(patronymic)
    patronymic.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end

  def self.valid_email?(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

  def self.valid_telegram?(telegram)
    telegram.match?(/^[a-zA-Z0-9_]{5,32}$/)
  end

  def self.valid_git?(git)
    git.match?(/^https:\/\/github\.com\/[a-zA-Z0-9_-]+\/[a-zA-Z0-9_-]+$/)
  end

  def to_s
    "ID: #{@id}\nSurname: #{@surname}\nName: #{@name}\nPatronymic: #{@patronymic}\nPhone number: #{[@phone]}\nTelegram: #{@telegram}\nEmail: #{@email}\nGitHub: #{@git}"
  end
end