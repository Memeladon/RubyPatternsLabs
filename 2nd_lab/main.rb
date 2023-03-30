require_relative 'student'

student1 = Student.new(1, 'Позов', 'Дмитрий', 'Темурович', '+79111234567', '@pozov', 'pozov@mail.ru', 'githubNO LINKS/pozov')
student2 = Student.new(2, 'Шастун', 'Антон', 'Андреевич', '+79112234567', '@shastoon', 'shastoon@didenok.com', 'githubNO LINKS/shastoon')

puts "Student 1:"
puts "ID: #{student1.id}"
puts "Last name: #{student1.last_name}"
puts "First name: #{student1.first_name}"
puts "Middle name: #{student1.middle_name}"
puts "Phone number: #{student1.phone_number}"
puts "Telegram: #{student1.telegram}"
puts "Email: #{student1.email}"
puts "GitHub: #{student1.github}"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts "ID: #{student2.id}"
puts "Last name: #{student2.last_name}"
puts "First name: #{student2.first_name}"
puts "Middle name: #{student2.middle_name}"
puts "Phone number: #{student2.phone_number}"
puts "Telegram: #{student2.telegram}"
puts "Email: #{student2.email}"
puts "GitHub: #{student2.github}"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
