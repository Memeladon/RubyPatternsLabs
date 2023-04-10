
class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone_number, :telegram, :email, :github

  def initialize(id:, last_name:, first_name:, middle_name:, phone_number: nil, telegram: nil, email: nil, github: nil)
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
