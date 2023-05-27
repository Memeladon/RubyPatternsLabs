class Student_super
  private_class_method :new

  public

  attr_reader :id, :git, :phone, :email, :telegram
  attr_writer :id
  def initialize(id:nil, phone:nil, telegram: nil, email: nil, git:nil )
    self.id=id
    self.git=git
    set_contacts(telegram:telegram, phone: phone, email:email, git:git)
  end

  #Сеттеры
  def phone=(value)
    raise ArgumentError, "Invalid phone" unless self.class.valid_phone?(value)
    @phone = value
  end
  def telegram=(value)
    raise ArgumentError, "Invalid telegram" unless self.class.valid_telegram?(value)
    @telegram = value
  end
  def email=(value)
    raise ArgumentError, "Invalid email" unless self.class.valid_email?(value)
    @email = value
  end
  def git=(value)
    raise ArgumentError, "Invalid git" unless self.class.valid_git?(value)
    @git = value
  end

  def set_contacts(phone: '', telegram: '', email: '', git: '')
    @phone = phone if Student.valid_phone_number?(phone)
    @telegram = telegram if Student.valid_telegram?(telegram)
    @email = email if Student.valid_email?(email)
    @git = git if  Student.valid_git?(git)
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

  #Метод validate
  def validate
    raise ArgumentError, 'No contact information provided' if !@phone && !@telegram && !@email
    # raise ArgumentError, 'No GitHub provided' unless @git
  end



end