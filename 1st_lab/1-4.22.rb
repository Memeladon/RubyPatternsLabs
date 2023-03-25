# Дан целочисленный массив и интервал a..b. Необходимо найти количество минимальных элементов в этом интервале.

def task22 a b arr
  range = (a..b)
  min_value = array[range].min
  return array[range].count(min_value)
end

puts ("Введите число a: ")
a = STDIN.gets.chomp.to_i
puts ("Введите число b: ")
b = STDIN.gets.chomp.to_i

arr = [1, 2, 3, 4, 1, 5, 6, 1]

puts task22

