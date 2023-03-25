require_relative 'student'

student_1 = Student.new(id: 1, last_name: "Иванов", first_name: "Иван",
    phone: "+79001234567", email: "ivanov@exampleNO LINKS")
student_2 = Student.new(id: 2, last_name: "Петров", first_name: "Петр", 
    middle_name: "Петрович", telegram: "@petr_petrov", github: "petr_petrov")

student_3 = Student.new(id: 3, last_name: "Сидоров", first
    t_name: "Сидор", telegram: "@sidor_sidorov")
    
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

puts "Студент 3:"
puts "ID: #{student_3.id}"
puts "ФИО: #{student_3.last_name} #{student_3.first_name} #{student_3.middle_name}"
puts "Телефон: #{student_3.phone}"
puts "Email: #{student_3.email}"
puts "Телеграм: #{student_3.telegram}"
puts "GitHub: #{student_3.github}"
puts "Номер телефона валидный: #{student_3.phone_valid?}"
puts
