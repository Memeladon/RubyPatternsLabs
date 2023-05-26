class Student
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  def initialize(args = {})
    @id = args[:id]
    @surname = args[:surname]
    @name = args[:name]
    @patronymic = args[:patronymic]
    @phone = args[:phone]
    @telegram = args[:telegram]
    @email = args[:email]
    @git = args[:git]
  end


end