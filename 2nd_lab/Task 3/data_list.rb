class Data_list
  attr_reader :data
  def initialize(data)
    @data = data
    @selected = []
  end
  def select(number)
    @selected << number unless @selected.include?(number)
  end
  def get_selected
    # Метод просто возвращает массив @selected.
    @selected
  end
  def get_names
    # names = ["Surname", "Name", "Patronymic", "Phone number", "Telegram", "Email", "GitHub"]
    raise NotImplementedError, "This method is implemented in subclasses"
  end
  def get_data
    raise NotImplementedError, "This method is implemented in subclasses"

    # data = []
    # @data.each_with_index do |student, i|
    #   student_data = []
    #   student_data << student[:id]
    #   student_data << student[:surname]
    #   student_data << student[:name]
    #   student_data << student[:patronymic]
    #   # student_data << student[:"Phone number"][0]
    #   student_data << student[:phone]
    #   student_data << student[:telegram]
    #   student_data << student[:email]
    #   student_data << student[:github]
    #   data << student_data
    # end
    # table = Data_table.new(data)
  end
end