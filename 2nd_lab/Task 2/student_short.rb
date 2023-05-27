class Student_short
  attr_reader :id, :surname_initials, :git, :contact

  def initialize(id , info)
    @id = id
    parseInfo(info)
  end

  def parseInfo(info)
    if info
      @surname_initials, @git, contact_info = info.split(';').map(&:strip)
      @contact = contact_info.split(': ')[1]
    end
  end
  def self.createByUser(student_obj)
    raise ArgumentError, 'Invalid argument type' unless student_obj.is_a?(Student)
    new(student_obj.id, student_obj.get_info)
  end

  def getInfo
    "Full name: #{@surname_initials}; GitHub: #{@git}; Contact: #{@contact}"
  end

end