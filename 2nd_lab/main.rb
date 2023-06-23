require_relative '../Task 1/'
require_relative '../Task 2/ort'
require_relative '../Task 2/per'

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 1:"
puts student1.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Student 2:"
puts student2.to_s
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

student2_short = Student_short.new(2, student2.getInfo)
puts student2_short.getInfoOut
################################################################
students = Data_table.new([
                            Student_short.from_obj(student1),
                            Student_short.from_obj(student2),
                            Student_short.from_obj(student3)
                          ])

data_list = Data_list_student_short.new(students.table)
p data_list.select(0)
p data_list.get_select
data_list.get_data.printer

################################################################
students = [student1, student2, student3]
Student_list.write_to_file("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.yaml", students, 'yaml')

'''
yaml_file = Students_list_YAML.new("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.yaml")
json_file = Students_list_YAML.new("D:/Dev/Ruby_work/RubyPatternsLabs/2nd_lab/Task 4/students.json")

json_strategy = Client.new(json_file)
json_strategy.read_all_students

yaml_strategy =  Client.new(yaml_file)
yaml_strategy.save_students(students)
'''