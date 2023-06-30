require_relative 'student_list_controller'

class Main
  include StudentsTrials

  def start_application
    main_controller = Student_list_controller.new
  end
end

Main.start_application