# Количество четных
def even_count num
    (1..num).each {|x|
        if (x.even? && !is_coprime?(x, num)) 
            puts x       
        end
    }
end
# Не взаимно простые 
def is_coprime? num, other_num
    if num.gcd(other_num) == 1
        return true
    else
        return false
    end
end

puts ("Введите число для обработки: ")
num = STDIN.gets.chomp.to_i
puts ("Введите число не взаимно простое с первым числом: ")
alter = STDIN.gets.chomp.to_i

puts (even_count num)