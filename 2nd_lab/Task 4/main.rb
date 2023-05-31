require_relative '../Task 1/student'
require_relative '../Task 4/students_list_json'
require_relative '../Task 4/students_list_yaml'
require_relative '../Task 4/superclass'
require_relative '../Task 4/Client'

########################################################################################################################

student1 = Student.new(id:1, surname:'Pozov', name:'Dmitry', patronymic:'Temurovich',  git:'https://github.com/username/pozov')
student1.set_contacts( phone:'8-800-555-35-35', telegram: 'pozovvv')
student1.validate

student2 = Student.new(id:2, surname:'Shastoon', name:'Anton', patronymic:'Andreevich', git:'https://github.com/username/shastoon')
student2.set_contacts(phone: "8-922-057-39-42", telegram: "shastoonnn", email: "shastoon@mail.com")
student2.validate

student3 = Student.new(id:3, surname:'Popov', name:'Arseniy', patronymic:'Sergeevich', git:'https://github.com/username/popov')
student3.set_contacts(phone: "8-918-356-23-47", telegram: "popovvv", email: "popov@mail.com")
student3.validate

########################################################################################################################

students = [student1, student2, student3]
Superclass.write_to_file("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.yaml", students, 'yaml')

'''
yaml_file = Students_list_YAML.new("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.yaml")
json_file = Students_list_YAML.new("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.json")

json_strategy = Client.new(json_file)
json_strategy.read_all_students

yaml_strategy =  Client.new(yaml_file)
yaml_strategy.save_students(students)
'''