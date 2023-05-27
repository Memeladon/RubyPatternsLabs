require_relative '../Task 2/student_super'
class Student < Student_super
  attr_accessor :surname, :name, :patronymic
  public_class_method :new
  def initialize(args = {})
    self.surname = args[:surname] || ''
    self.name = args[:name] || ''
    self.patronymic = args[:patronymic] || ''

    raise ArgumentError, 'Invalid surname' unless Student.valid_name?(@surname)
    raise ArgumentError, 'Invalid name' unless Student.valid_name?(@name)
    raise ArgumentError, 'Invalid patronymic' unless Student.valid_name?(@patronymic)

    super(id:id, phone:phone, telegram:telegram, email:email, git:git)
  end



  def self.valid_name?(name)
    name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
  end

  def getInfo
    initials = self.name[0] + '. ' + self.patronymic[0] + '.'
    contact_info = (@phone.empty? ? 'Telegram' : 'Phone') + ': ' + (@phone.empty? ? @telegram : @phone)
    "Full name: #{@surname} #{initials}; GitHub: #{@git}; Contact: #{contact_info}"
  end

end