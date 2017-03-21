timer_start = Time.now
 
require 'prime'

answer = nil

(3..140000).each do |x|
  next if Prime.prime?(x)
  factors = []
  (2..(x/2+1).to_i).each do |y|
    factors << y if x % y == 0
  end
  prime_factors = factors.select { |y| y if Prime.prime?(y) }
  if prime_factors.count == 4
    (1..3).each do |z|
      check_next_factors = []
      (2..(((x+z)/2)+1).to_i).each do |y|
        check_next_factors << y if (x+z) % y == 0
      end
      next_prime_factors = check_next_factors.select { |y| y if Prime.prime?(y) }
      break if next_prime_factors.count != 4
      if z == 3
        answer = x
      end
    end
  end
  break if answer
end
puts answer

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"