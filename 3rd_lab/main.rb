require_relative 'database_manipulation'
require_relative 'student_list_db'
require_relative 'modules/students_trials'

class Main
  include StudentsTrials
  def self.testing
    db = Student_list_DB.new
    db.create_table

    # db.get_student_by_id(5)
    # db.get_k_n_student_short_list(2,2)

    # db.add_student(STUDENT1)
    # db.add_student(STUDENT2)
    # db.add_student(STUDENT3)
    # db.add_student(STUDENT4)
    # db.add_student(STUDENT5)

  end
end

Main.testing