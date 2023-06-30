# Контроллер это стратегия для Вьюхи!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# Во вьюхе есть ссылка на объект контроллера. У контроллера есть на модель.

class Student_list_controller
  attr_reader :model, :view, :students_list

  def initialize
    # @model = Student_list_DB.new
    @view = View.new(self)
    @student_list = Student_list.new(Students_list_JSON.new('3rd_lab/JSON_document'))
  end

  # Методы для работы с моделью данных(student_list)
  def read_from_file
    @student_list.read_from_file
  end

  def write_to_file(new_students)
    @student_list.write_to_file(new_students)
  end

  def get_student_by_id(id)
    @student_list.get_student_by_id(id)
  end

  def get_k_n_student_short_list(k, n, data_list)
    @student_list.get_k_n_student_short_list(k, n, data_list)
  end

  def add_student(student)
    @student_list.add_student(student)
  end

  def replace_student_by_id(id, new_student)
    @student_list.replace_student_by_id(id, new_student)
  end

  def delete_student_by_id(id)
    @student_list.delete_student_by_id(id)
  end

  def get_student_short_count(data_list)
    @student_list.get_student_short_count(data_list)
  end

  # # Методы для работы с моделью данных (student.db)
  # def add_student(student)
  #   @model.add_student(student)
  # end
  # def delete_student(student_id)
  #   @model.delete_student(student_id)
  # end
  # def replace_student(student)
  #   @model.replace_student(student)
  # end
  # def get_all_students
  #   @model.get_all_students
  # end

  # Методы для работы с представлением (view)
  def render_table
    view.render_table(@model.get_all_students)
  end

  def render_details(student_id)
    student = @model.get_student_by_id(student_id)
    view.render_details(student)
  end

end