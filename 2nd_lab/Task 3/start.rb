require_relative '../Task 1/student'
require_relative '../Task 2/student_short'
require_relative '../Task 3/data_list_student_short'
require_relative '../Task 3/data_table'

########################################################################################################################

student1 = Student.new(id:1, surname:'Pozov', name:'Dmitry', patronymic:'Temurovich',  git:'https://github.com/username/pozov')
student1.set_contacts( phone:'8-800-555-35-35', telegram: 'pozovvv')
student1.validate

student2 = Student.new(id:2, surname:'Shastoon', name:'Anton', patronymic:'Andreevich', git:'https://github.com/username/shastoon')
student2.set_contacts(phone: "8-922-057-39-42", telegram: "shastoonnn", email: "shastoon@mail.com")
student2.validate

student3 = Student.new(id:2, surname:'Popov', name:'Arseniy', patronymic:'Sergeevich', git:'https://github.com/username/popov')
student3.set_contacts(phone: "8-918-356-23-47", telegram: "popovvv", email: "popov@mail.com")
student3.validate

########################################################################################################################

students = Data_table.new([
 Student_short.from_obj(student1),
 Student_short.from_obj(student2),
 Student_short.from_obj(student3)
])
data_list = Data_list_student_short.new(students)

puts data_list.get_names.inspect # ["Surname_initials", "Git", "Contact"]
puts data_list.get_data(students[0]).inspect # ["Pozov D. T.", "https://github.com/username/pozov", "8-800-555-35-35"]

