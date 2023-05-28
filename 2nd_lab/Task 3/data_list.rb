class Data_list
  attr_reader :data, :names
  def initialize(data)
    @names = get_names
    self.data = data
    @selected = []
  end

  def data=(data)
    @data = validated_data(data)
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

  private
  def validated_data(data)
    raise ArgumentError, "Data should be an array" unless data.is_a?(Array)
    raise ArgumentError, "Data should not be empty" if data.empty?
    raise ArgumentError, "Data elements should have the same structure" unless data.all? { |obj| obj.instance_of?(data[0].class) }
    raise ArgumentError, "Data elements should have properties #{names}" unless data.all? { |obj| names.all? { |prop| obj.respond_to?(prop) } }

    data
  end

end