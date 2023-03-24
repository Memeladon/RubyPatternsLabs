# Файл будет работать, откуда бы мы его ни запускали
require_relative 'student'

student_1 = Student.new(id: 1, last_name: "Иванов", first_name: "Иван", phone: "+79001234567", email: "ivanov@mail.ru")
student_2 = Student.new(id: 2, last_name: "Петров", first_name: "Петр", middle_name: "Петрович", telegram: "@petr_petrov", github: "petr")

puts "Студент 1:"
puts "ID: #{student_1.id}"
puts "ФИО: #{student_1.last_name} #{student_1.first_name} #{student_1.middle_name}"
puts "Телефон: #{student_1.phone}"
puts "Email: #{student_1.email}"
puts "Телеграм: #{student_1.telegram}"
puts "GitHub: #{student_1.github}"
puts "Номер телефона валидный: #{student_1.phone_valid?}"
puts

puts "Студент 2:"
puts "ID: #{student_2.id}"
puts "ФИО: #{student_2.last_name} #{student_2.first_name} #{student_2.middle_name}"
puts "Телефон: #{student_2.phone}"
puts "Email: #{student_2.email}"
puts "Телеграм: #{student_2.telegram}"
puts "GitHub: #{student_2.github}"
puts "Номер телефона валидный: #{student_2.phone_valid?}"
puts
