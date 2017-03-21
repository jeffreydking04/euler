timer_start = Time.now

require 'prime'

primes = Prime.take(550)
found = false
answer = 0
count = 0


549.downto(0).each do |x|
  (549-x).downto(0).each do |y|
    count += 1
    sum = 0
    (x+y).downto(y).each { |z| sum += primes[z] }
    if Prime.prime?(sum) &&  sum < 1000000
      found = true
      answer = sum
    end
    break if found
  end
  break if found
end
p count
p answer

# max_found = 0
# max_possible = 545
# min =  953
# max =  1000000
# found = false
# answer = 0
# 
# max_possible.downto(max_found).each do |number_of_terms|
#   min_sum = 0
#   (0...number_of_terms).each { |x| min_sum += primes[x] }
#   max.downto(min).each do |num|
#     break if min_sum > num
#     next if !Prime.prime?(num)
#     p "#{num}: #{min_sum}"
#     (0..primes.count-number_of_terms).each do |start|
#       subset = primes[start...start+number_of_terms]
#       sum = 0
#       subset.each {|prime| sum += prime }
#       next if sum > num
#       if sum == num
#         found = true
#         answer = num  
#       end
#       break if found
#     end
#     break if found
#   end
#   break if found
# end
# 
# 
# p answer

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"