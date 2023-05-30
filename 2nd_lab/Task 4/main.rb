require_relative '../Task 1/student'
require_relative '../Task 2/student_short'
require_relative '../Task 3/data_list_student_short'
require_relative '../Task 3/data_table'
require_relative '../Task 4/students_list_json'
require_relative '../Task 4/students_list_yaml'

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

students = [student1, student2, student3]
Students_list_JSON.write_to_file("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.json", students )
Students_list_YAML.write_to_file("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.yaml", students )
