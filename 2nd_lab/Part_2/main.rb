require_relative 'student.rb'

student1 = Student.new('1;Позов;Дмитрий;Темурович;+79111234567;;;githubNO LINKS/pozov')
student2 = Student.new('2;Шастун;Антон;Андреевич;+79112234567;@shastoon;shastoon@didenok.com;githubNO LINKS/shastoon')
# student2.set_contacts(phone_number: "+79111111111", telegram: "@shastoon_new", email: "shastoon@mail.com")

puts "Student 1:"
puts student1.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

