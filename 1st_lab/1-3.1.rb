# for
def find_minF(arr)
    min = arr[0]
    for i in arr
      min = min > i ? i : min
    end
    min
  end
    
  def find_first_positiveF(arr)
    first_pos = 0
    for i in arr
      if i > 0 then return i end
    end
    first_pos
  end

# while
  def find_minW(arr)
    min = arr[0]
    i = 0
    while i < arr.length
      min = min > arr[i] ? arr[i] : min
      i += 1
    end
    min
  end

  
  def find_first_positiveW(arr)
    first_pos = 0
    i = 0
    while i < arr.length
      if arr[i] > 0 then return arr[i] end
      i += 1
    end
    first_pos
  end 
   