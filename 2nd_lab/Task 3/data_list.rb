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
    raise NotImplementedError, "This method is implemented in subclasses"
  end
  def get_data(obj)
    raise NotImplementedError, "This method is implemented in subclasses"
  end

end