require_relative '../Task 2/student_super'
class Student < Student_super
  attr_accessor :surname, :name, :patronymic
  public_class_method :new
  def initialize(args = {})
    self.id = args[:id] || ''
    self.surname = args[:surname] || ''
    self.name = args[:name] || ''
    self.patronymic = args[:patronymic] || ''
    self.git = args[:git] || ''
    raise ArgumentError, 'Invalid surname' unless Student.valid_name?(@surname)
    raise ArgumentError, 'Invalid name' unless Student.valid_name?(@name)
    raise ArgumentError, 'Invalid patronymic' unless Student.valid_name?(@patronymic)

    set_contacts(telegram:args[:telegram], phone: args[:phone], email:args[:email])

  end

  def getInfo
    initials = self.name[0] + '. ' + self.patronymic[0] + '.'
    contact_info = (@phone.empty? ? 'Telegram' : 'Phone') + ': ' + (@phone.empty? ? @telegram : @phone)
    "#{@surname} #{initials}; #{@git}; #{contact_info}"
  end

end