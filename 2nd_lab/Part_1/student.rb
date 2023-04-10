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
  
    validate_phone_number_presence
    validate_contact_presence
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






