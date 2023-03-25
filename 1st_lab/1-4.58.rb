# Для введенного списка вывести количество элементов, которые могут быть получены как сумма двух любых других элементов списка.

def count_summable_numbers(list)
  count = 0
    list.each do |num|
      list.each do |num2|
        next if num == num2
        sum = num + num2
        count += 1 if list.include?(sum)
      end
    end
  count / 2 # деление на два, чтобы исключить дублирование результатов
end

list = [1, 2, 3, 4, 5, 6]
puts count_summable_numbers(list) # => 3

