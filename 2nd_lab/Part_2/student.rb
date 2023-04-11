# student.rb

class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone_number, :telegram, :email, :github

  def initialize(data)
    parse_data(data)
    
    validate_phone_number_presence
    validate_contact_presence
  end

  def parse_data(data)
    parts = data.split(';')
    raise ArgumentError, "Неправильный формат данных" unless parts.size == 8

    @id = parts[0].to_i
    @last_name = parts[1]
    @first_name = parts[2]
    @middle_name = parts[3]
    @phone_number = parts[4]
    @telegram = parts[5]
    @email = parts[6]
    @github = parts[7]
  end

  def set_contacts(**contacts)
    @phone_number = contacts[:phone_number] if contacts[:phone_number]
    @telegram = contacts[:telegram] if contacts[:telegram]
    @email = contacts[:email] if contacts[:email]
    @github = contacts[:github] if contacts[:github]
    
    validate_phone_number_presence
    validate_contact_presence
  end

  def validate_phone_number_presence
    raise "Не указан номер телефона" unless @phone_number
  end

  def validate_contact_presence
    raise "Не указан контакт для связи" unless @github || @telegram || @email
  end

  def to_s
    "ID: #{@id}\nФамилия: #{@last_name}\nИмя: #{@first_name}\nОтчество: #{@middle_name}\nНомер: #{@phone_number}\nTelegram: #{@telegram}\nEmail: #{@email}\nGitHub: #{@github}"
  end

end






