require_relative '../Task 1/student'
require_relative '../Task 2/student_short'
require_relative '../Task 2/student_super'

student1 = Student.new(id:1, surname:'Pozov', name:'Dmitry', patronymic:'Temurovich',  git:'https://github.com/username/pozov')
student1.set_contacts(telegram: 'pozov', phone:'8-800-555-35-35')
student1.validate

student2 = Student.new(id:2, surname:'Shastoon', name:'Anton', patronymic:'Andreevich', git:'https://github.com/username/shastoon')
student2.set_contacts(phone: "8-800-000-00-01", telegram: "shastoon", email: "shastoon@mail.com")
student2.validate

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 1:"
puts student1.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

student2_short = Student_short.new(2, student2.getInfo)
puts student2_short.GetInfoOut