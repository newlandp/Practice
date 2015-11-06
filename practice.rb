def main
    
    print "what is your max number? "
    num = gets.chomp.to_i
    
    #puts "the sum of even fibonaccis under #{num} is #{even_fibonacci_sum(num)}"
    puts largest_prime_factor(num)
    
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

main


