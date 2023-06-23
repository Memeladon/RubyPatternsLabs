require_relative 'student_super'
class Student_short < Student_super
  attr_reader :id, :surname_initials, :git, :contact
  public_class_method :new

  def initialize(id , info)
    @id = id
    parseInfo(info)
  end
  def self.from_obj(student)
    raise ArgumentError, 'Invalid argument type' unless student.is_a?(Student)
    new(student.id, student.getInfo)
  end

  def getInfoOut
    "Full name: #{@surname_initials}; GitHub: #{@git}; Contact: #{@contact}"
  end

  private
  def parseInfo(info)
    if info
      @surname_initials = "#{info['surname']} #{info['name'][0]}. #{info['patronymic'][0]}."
      @git = info['git']
      @contact = info['phone'] || info['email'] || info['telegram']
    end
  end
end