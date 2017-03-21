timer_start = Time.now

require 'mathn'

# digit_array = [1,2,3,4,5,6,7]
# permutations_array = digit_array.permutation(7).to_a
# 
# prime_array = []
# 
# permutations_array.each do |x|
#   y = x.join("").to_i
#   prime_array << y if Prime.prime?(y)
# end
# 
# max = 0
# 
# prime_array.each do |x|
#   max = x if x > max
# end
# 
# p max

answer = 0
(7654321).downto(0).each do |x|
  next if !Prime.prime?(x)
  y = x.to_s.chars.uniq
  next if y.include?("9")
  next if y.include?("8")
  answer = x if y.count == 7
  break if y.count == 7
end
p answer

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"

# This one is neat because there are at least a couple of general approaches.
# You can either find all the primes by counting up (takes too long), 
# or count down from 987654321, checking for prime then pandigital; first one
# you find is the answer, except that this will take far too long as well, but
# the reason why is not obvious until you see it.  Then you think you are dumb.
# The sum of the first 9 digits is 45, which is divisable by 3, which implies
# that no pandigital number with n = 9 can be prime.  Same for 8 because sum
# is 36. But if we start at 7654321, the largest possible pandigital 7 number 
# and countdown, we find our answer instantly.

# A solution that finds all 7 digit permutations of 1234567, then checks for prime
# and finally selects the largest is commented out.  It takes nearly 3 times as long,
# but it might be an idea that is of use later.