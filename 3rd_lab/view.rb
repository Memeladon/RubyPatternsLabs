class View
  attr_reader :controller

  def initialize(controller)
    @controller = controller
  end

  def open_window
    load 'main_window'
  end

  def render_table(students)
    # Визуализация таблицы со студентами
  end

  def render_details(student)
    # Визуализация подробной информации о студенте
  end

end
