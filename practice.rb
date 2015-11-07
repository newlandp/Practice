def main
    
    print "what is your max number? "
    num = gets.chomp.to_i
    
    #puts "the sum of even fibonaccis under #{num} is #{even_fibonacci_sum(num)}"
    #puts get_factors(num)
    #puts is_palindrome?(num)
    puts smallest_multiple_1_to_x(num)
    
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

main


