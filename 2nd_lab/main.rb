require_relative 'student.rb'

student1 = Student.new(id:1, last_name:'Ppzov', first_name:'Dmitry', surname:'Temurovich', phone_number:'8-800-555-35-35')
student2 = Student.new(id:2, last_name:'Shastoon', first_name:'Anton', surname:'Andreevich', phone_number:'8-800-555-35-35',
                       telegram:'@shastoon', email:'shastoon@didenok.com', github:'githubNO LINKS/shastoon')
student2.set_contacts(phone_number: "8-800-000-00-01", telegram: "@shastoon", email: "shastoon@mail.com",
                      github:'githubNO LINKS/pozov')


puts "Student 1:"
puts student1.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2 new:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"