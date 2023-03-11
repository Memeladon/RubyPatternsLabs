def sum_digit_less5 num
    res = num.to_s.split("").map(&:to_i)
    res = res.select {|x| x < 5}
    return res.inject(0, :+)
end

def min_div_num num
    divs = (2..num).select {|x| num % x == 0}
    return divs.min
end

def is_coprime? num, other_num
    if num.gcd(other_num) == 1
        return true
    else
        return false
    end
end

def calk num
        result = 1
    for i in (1..num) do
        if (i % (min_div_num num) != 0 && !is_coprime?(i, num) && i > result)
            result = i
        end
    end
    return result * sum_digit_less5(num)

end


puts ("Введите число для обработки: ")
num = STDIN.gets.chomp.to_i

puts sum_digit_less5 num
puts min_div_num num
puts calk num