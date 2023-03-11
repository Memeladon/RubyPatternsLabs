# Макс цифра в числе и !% 3 != 0
def max_digit num
    num = num.to.s.split("").map(&:to_i)
    result = num[0]

    for digit in num do
        if digit % 3 != 0 && digit > result
            result= digit
        end
    end
    
end

puts ("Введите число для обработки: ")
num = STDIN.gets.chomp.to_i
puts(max_digit num)