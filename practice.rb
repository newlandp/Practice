def main
    
    # puts "what is your number? "
    # num = gets.chomp.to_i
    # puts "what is your exponent? "
    # exponent = gets.chomp.to_i
    
    # #puts "the sum of even fibonaccis under #{num} is #{even_fibonacci_sum(num)}"
    # #puts get_factors(num)
    # #puts is_palindrome?(num)
    # puts power_digit_sum(num, exponent)
    # puts "what is your string? "
    # str = gets.chomp
    # puts "what is your shift factor? "
    # num = gets.chomp.to_i
    # puts caesar_cipher(str, num)
    
    puts factorial_digit_sum(100)
    
end

def fact(n)
    result = 1
    unless n == 0
        while n > 0
            result = n * result
            n -= 1
        end
    end
    result
end

def sum_3_and_5_multiples(max)
    total = 0
    (0...max).each do |n|
        if n % 3 == 0 || n % 5 == 0
            total += n
        end
    end
    total
end

def even_fibonacci_sum(max)
    first = 1
    second = 2
    total = 2
    
    while second < max
        sum = first + second
        total += sum if sum % 2 == 0
        first = second
        second = sum
    end
    
    total
    
end

def get_factors(num)
    factors = []
    
    (1..((num**0.5) + 1)).each do |n|
        factors.push(n) if num % n == 0
    end
    
    factors.each { |n| factors << (num / n) unless factors.include?(num / n) }
    
    factors
end

def is_prime?(num)
    is_prime = true
    
    (2..((num**0.5) + 1)).each do |n|
        is_prime = false if num % n == 0
    end
    
    is_prime
end

def largest_prime_factor(num)
    factors = get_factors(num)
    prime_factors = []
    
    factors.each { |n| prime_factors << n if is_prime?(n) }
    
    prime_factors.delete(1)
    prime_factors.max
end

def is_palindrome?(num)
    num.to_s == num.to_s.reverse
end

def get_all_sums_of_x_digit_numbers(digits)
    start = 1
    (digits - 1).times { start *= 10 }
    finish = start * 10
    sums = []
    
    (start...finish).each do |x|
        (start...finish).each do |y|
            sums << x * y
        end
    end
    
    sums.sort.uniq
end

def largest_palindrome(digits)
    a = get_all_sums_of_x_digit_numbers(digits)
    
    largest_p = nil
    
    a.reverse_each do |n|
        largest_p = n if is_palindrome?(n)
        break if largest_p
    end
    
    largest_p
end

def smallest_multiple_1_to_x(max)
    jump = max * (max - 1)
    index = jump
    count = 0
    
    until count == max
        count = 0
        (1..max).each { |n| count += 1 if index % n == 0 }
        
        index += jump
    end
    
    index -= jump
end

def sum_square_difference(max)
    sum_of_squares = 0
    square_of_sums = 0
    
    (1..max).each { |n| sum_of_squares += n ** 2 }
    
    (1..max).each { |n| square_of_sums += n }
    square_of_sums = square_of_sums ** 2
    
    square_of_sums - sum_of_squares
end

def nth_prime(num)
    primes = 2
    place = 3
    while primes < num
        place += 2
        unless place % 3 == 0
            primes += 1 if is_prime?(place)
        end
    end
    place
end

def number_of_factors(num)
    get_factors(num).length
end

def triangular_number_divisible_by(num)
    add = 1
    triangular_number = add
    
    until number_of_factors(triangular_number) >= num
        add += 1
        triangular_number += add
    end
    
    triangular_number
end

def sum_of_digits(num)
    num = num.to_s.split(//)
    total = 0
    
    num.each { |n| total += n.to_i }
    
    total
end

def power_digit_sum(num, exponent)
    num = num ** exponent
    sum_of_digits(num)
end

def caesar_cipher(string, shift)
    string_array = []
    new_string = []
    string.downcase!
    
    string.each_byte do |c|
        string_array << c
    end
    
    string_array.each do |c|
        c += shift
        c -= 26 if c > 122
        c = c.chr
        new_string << c
    end
    new_string.join("")
end

def stock_picker(stocks)
    max_difference = 0
    days = []
    
    for i in (0...(stocks.length - 1))
        for j in ((i + 1)...stocks.length)
            if (stocks[j] - stocks[i]) > max_difference
                max_difference = (stocks[j] - stocks[i])
                days[0] = i
                days[1] = j
            end
        end
    end
    
    days
end

def factorial_digit_sum(num)
    total = 1
    for n in 1..num
        total = total * n
    end
    total = total.to_s
    numbers = total.split(//)
    sum = 0
    numbers.each { |n| sum += n.to_i }
    sum
end

main


