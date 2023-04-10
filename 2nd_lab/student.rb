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

  def validate_phone_number_presence
    raise "Не указан омер телефона" unless @phone_number
  end

  def validate_contact_presence
    raise "Не указан контакт для связи" unless @github || @telegram || @email
  end
  
end






