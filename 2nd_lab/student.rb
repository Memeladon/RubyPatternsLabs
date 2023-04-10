# student.rb

class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone_number, :telegram, :email, :github

  def initialize(id:, last_name:, first_name:, middle_name:, **contacts)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone_number = contacts[:phone_number]
    @telegram = contacts[:telegram]
    @email = contacts[:email]
    @github = contacts[:github]
  
    validate_phone_number
    validate_last_name
    validate_first_name
    validate_middle_name
    validate_telegram
    validate_email
    validate_github
  end

  def validate_phone_number
    raise "Неправильный формат номера" unless @phone_number =~ /^\+\d{11}$/
  end

  def validate_last_name
    raise "Неправильный формат Фамилии" unless @last_name =~ /^[A-Za-z\-]+$/
  end

  def validate_first_name
    raise "Неправильный формат имени" unless @first_name =~ /^[A-Za-z\-]+$/
  end

  def validate_middle_name
    raise "Неправильный формат Отчества" unless @middle_name =~ /^[A-Za-z\-]*$/
  end

  def validate_telegram
    raise "Неправильный формат телеграмма" unless @telegram =~ /^@[A-Za-z]*$/
  end

  def validate_email
    raise "Неправильный формат почты" unless @email =~ /^([A-Za-z0-9]+[_\.\-]?)*[A-Za-z0-9]+@([A-Za-z0-9]+[\.\-]?)*[A-Za-z0-9]+\.[A-Za-z]{2,}$/
  end

  def validate_github
    raise "Неправильный формат гита" unless @github =~ /^https:\/\/githubNO LINKS\/[A-Za-z0-9_\-]+\/?$/
  end

  def to_s
    "ID: #{@id}\nФамилия: #{@last_name}\nИмя: #{@first_name}\nОтчество: #{@middle_name}\nНомер: #{@phone_number}\nTelegram: #{@telegram}\nEmail: #{@email}\nGitHub: #{@github}"
  end

end





