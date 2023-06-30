module Observer
  def initialize
    @observers=[]
  end

  def add_observer(observer)
    @observers << observer unless @observers.include?(observer)
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end
