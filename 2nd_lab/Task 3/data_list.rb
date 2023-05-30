class Data_list
  # private_class_method :new
  # public_class_method :new
  attr_accessor :data_list, :selected_data

  def initialize(data)
    self.data_list = data
    self.selected_data = []
  end
  def select(*numbers)
    selected_data.append(*numbers)
  end
  def get_select
    selected_data.inject([]) {|res, index| res<<data_list[index].id}
  end
  def clear_selected
    self.selected_data = []
  end

  # применение паттерна Шаблон
  def get_names
    raise NotImplementedError, "This method is implemented in subclasses"
  end
  def get_data(obj)
    raise NotImplementedError, "This method is implemented in subclasses"
  end

end