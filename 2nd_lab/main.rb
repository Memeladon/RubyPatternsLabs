require_relative 'student'

student1 = Student.new(1, 'Позов', 'Дмитрий', 'Темурович', '+79111234567', '@pozov', 'pozov@mail.ru', 'githubNO LINKS/pozov')
student2 = Student.new(2, 'Шастун', 'Антон', 'Андреевич', '+79112234567', '@shastoon', 'shastoon@didenok.com', 'githubNO LINKS/shastoon')

puts "Student 1:"
puts student1.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
