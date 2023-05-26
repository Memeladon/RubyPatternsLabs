class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(args = {})
    @id = args[:id]
    @surname = args[:surname] || ''
    @name = args[:name] || ''
    @patronymic = args[:patronymic] || ''
    @phone = args[:phone] || ''

    raise ArgumentError, 'Invalid phone number' unless Student.valid_phone_number?(@phone)

    @telegram = args[:telegram] || ''
    @email = args[:email] || ''
    @git = args[:git] || ''
  end

  def self.valid_phone_number?(phone)
    phone.to_s.match?(/^(\+)?((\d{2,3}) ?\d|\d)(([ -]?\d)|( ?(\d{2,3}) ?)){5,12}\d$/)
  end

  def to_s
    "ID: #{@id}\nSurname: #{@surname}\nName: #{@name}\nPatronymic: #{@patronymic}\nPhone number: #{[@phone]}\nTelegram: #{@telegram}\nEmail: #{@email}\nGitHub: #{@git}"
  end



end