require_relative 'student.rb'

student1 = Student.new(id:1, last_name:'Позов', first_name:'Дмитрий', middle_name:'Темурович', phone_number:'+79111234567', github:'githubNO LINKS/pozov')
student2 = Student.new(id:2, last_name:'Шастун', first_name:'Антон', middle_name:'Андреевич', phone_number:'+79112234567',
    telegram:'@shastoon', email:'shastoon@didenok.com', github:'githubNO LINKS/shastoon')
student2.set_contacts(phone_number: "+79111111111", telegram: "@shastoon_new", email: "shastoon@mail.com")

puts "Student 1:"
puts student1.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2 new:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

