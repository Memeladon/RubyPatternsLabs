# Даны два массива. Необходимо найти количество совпадающих по значению элементов.

array1 = [1, 2, 3, 4, 5, 6]
array2 = [5, 6, 7, 8, 9, 10]

count = 0
array1.each do |element|
  count += 1 if array2.include?(element)
end

puts count 