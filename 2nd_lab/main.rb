require_relative 'student.rb'

student1 = Student.new(id:1, surname:'Pozov', name:'Dmitry', patronymic:'Temurovich', phone:'8-800-555-35-35')
student2 = Student.new(id:2, surname:'Shastoon', name:'Anton', patronymic:'Andreevich', phone:'8-800-555-35-35',
                       telegram:'shastoon', email:'shastoon@didenok.com', git:'github/shastoon')
# student2.set_contacts(phone: "8-800-000-00-01", telegram: "shastoon", email: "shastoon@mail.com",
#                       git:'github/pozov')


puts "Student 1:"
puts student1.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2 new:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"