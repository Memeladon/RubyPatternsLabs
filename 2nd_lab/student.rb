
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
end

def validate_phone_number
  # Обработка исключений // Оператор unless проверяет отрицание
  raise "Неправильно набран номер" unless @phone_number =~ /^\+\d{11}$/
end

  def to_s
    "ID: #{@id}\nLast name: #{@last_name}\nFirst name: #{@first_name}\nMiddle name: #{@middle_name}\nPhone number: #{@phone_number}\nTelegram: #{@telegram}\nEmail: #{@email}\nGitHub: #{@github}"
  end

end
