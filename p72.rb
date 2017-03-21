timer_start = Time.now

require 'prime'

count = 0

(2..1000000).each do |x|
  count += Prime.prime_division(x).map {|e| e[0]}.inject(x) { |prod, e| prod * (1 - 1.0/e) }.floor
end

p count

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"

# This one is just the sum of the totients from 2 to 1 million.  Why?
# Because if a fraction can be reduced, the numberator and denominator
# will have a gcd > 1.  Irreducibles will have a gcd of 1, which means
# the numerator is relatively prime to the denominator, so it will be part
# of the totient count.
# So the proper fractions for a given n correspond to the totient count.
# If a fraction can be reduced, then it will be one of the fractions
# for a lower n and will be counted.