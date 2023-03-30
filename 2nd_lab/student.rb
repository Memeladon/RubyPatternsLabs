
class Student
  attr_reader :phone_number,  :email, :github
  attr_writer :telegram, :id, :last_name, :first_name, :middle_name

  def initialize(id, last_name, first_name, middle_name, phone_number, telegram, email, github)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone_number = phone_number
    @telegram = telegram
    @email = email
    @github = github
  end

  def to_s
    "ID: #{@id}\nLast name: #{@last_name}\nFirst name: #{@first_name}\nMiddle name: #{@middle_name}\nPhone number: #{@phone_number}\nTelegram: #{@telegram}\nEmail: #{@email}\nGitHub: #{@github}"
    end
end
