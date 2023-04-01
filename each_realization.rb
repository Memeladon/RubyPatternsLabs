class Itsworks
  
  def initialize(arr)
    @arr = arr
  end
  
  def good_each
    i = 0
    while i < @arr.length
      yield @arr[i]
      i += 1
    end
  end

end


l = Itsworks.new([1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,0])
l.good_each {|x| puts x}
