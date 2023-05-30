class Student_super
  private_class_method :new

  public

  attr_reader :id, :git, :phone, :email, :telegram

  #Сеттеры
  def id=(id)
    @id = id
  end
  def phone=(phone)
    raise ArgumentError, "Invalid phone" unless self.class.valid_phone_number?(phone)
    @phone = phone
  end
  def telegram=(telegram)
    raise ArgumentError, "Invalid telegram" unless self.class.valid_telegram?(telegram)
    @telegram = telegram
  end
  def email=(email)
    raise ArgumentError, "Invalid email" unless self.class.valid_email?(email)
    @email = email
  end
  def git=(value)
    # raise ArgumentError, "Invalid git" unless self.class.valid_git?(value)
    @git = value
  end

  def set_contacts(phone: '', telegram: '', email: '')
    @phone = phone if Student.valid_phone_number?(phone)
    @telegram = telegram if Student.valid_telegram?(telegram)
    @email = email if Student.valid_email?(email)
  end

  # Поиск средства связи для get_info


  def to_s
    "ID: #{@id}\nSurname: #{@surname}\nName: #{@name}\nPatronymic: #{@patronymic}\nPhone number: #{[@phone]}\nTelegram: #{@telegram}\nEmail: #{@email}\nGitHub: #{@git}"
  end

  # public

  # Валидация
  def self.valid_phone_number?(phone)
    phone.nil? || phone.to_s.match?(/^(\+)?((\d{2,3}) ?\d|\d)(([ -]?\d)|( ?(\d{2,3}) ?)){5,12}\d$/)
  end

  def self.valid_email?(email)
    email.nil? || email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

  def self.valid_telegram?(telegram)
    telegram.nil? || telegram.match?(/^[a-zA-Z0-9_]{5,32}$/)
  end

  def self.valid_git?(git)
    git.nil? || git.match?(/^https:\/\/github\.com\/[a-zA-Z0-9_-]+\/[a-zA-Z0-9_-]+$/)
  end
  def self.valid_name?(name)
    name == '' ||name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end


  #Метод validate
  def validate
    raise ArgumentError, 'No contact information provided' if !@phone && !@telegram && !@email
    # raise ArgumentError, 'No GitHub provided' unless @git
  end
end