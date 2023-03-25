# Дан целочисленный массив. Необходимо вывести вначале его положительные элементы, а затем - отрицательные.

array = [3, -2, 7, -1, 0, -5, 2]

positive = array.select { |num| num > 0 }
negative = array.select { |num| num < 0 }
result = positive + negative

puts result

# Результат вывода: 3 7 2 -2 -1 0 -5