timer_start = Time.now



require 'prime'
max = 0
answer = 0
#primes = Prime.take(168)
#
#array = Array.new
#
#(284000..10000000).each do |x|
#  flag = true
#  flag = false if x.prime?
#  primes.each do |y|
#    if x % y == 0
#      flag = false
#      break
#    end
#  end
#  sum = 0
#  array << x if flag
#end
#p array.size
#array.reverse!
#array.each do |x|
#  prim = Prime.prime_division(x)
#  if prim.size == 2
#    count = (prim[0][0] - 1) * (prim[1][0] - 1)
#  else
#    count = (prim[0][0] - 1) * prim[0][0]
#  end
#  g = x.to_s.split("").sort
#  c = count.to_s.split("").sort
#  pot = count * 1.0 / x if c == g
#  if pot && pot > max
#    max = pot
#    answer = x
#    p x
#  end
#end

# The above works, but what follows, which is definitely not my idea, is fucking brilliant.
# Because we can find answers in which phi/n is over .999, then we can eliminate any number that
# has a prime factor less than 1000.  Also we can eliminate primes, because the phi of a prime 
# number is 1 less than the number itself and 0 cannot be the final digit of the prime, thus
# phi and n differ by exactly 1 digit and cannot be a permutation (otherwise this would be 
# a trivial exercise).  Examining the remaining list of valid options confirms they all are
# a product of exactly two, possibly identical, primes.  I figured that much out by trial and
# error. But this implies that 1 of the primes must be less than 3162 and must be more
# than 1000.  Which leaves us with 278 possible primes.  It is a simple matter then of 
# of checking each of those primes with all primes greater than 1000 and less than 5 million for which their product is less than 
# 10 million, short circuiting of course where possible.  Roughly 152000 potential numbers must be checked,
# trivially fast for today's computing speeds.  Especially when we are using the (p-1)(q-1) shortcut.

primes = Prime.take(1000000)
primes = primes.select { |e| e if e < 5000000 && e > 1000 }
other = primes.select { |e| e if e > 1000 && e < 3163 }

other.reverse!

other.each do |x|
  z = 10000000/x  
  (0...primes.size).each do |y|
    d = primes[y]

    break if d > z
    n = x * d
    c = (x-1) * (d-1)
    c = x * (x-1) if x == d
    n1 = n.to_s.split("").sort
    c1 = c.to_s.split("").sort
    if n1 == c1
      w = c * 1.0 / n
      if w > max
        max = w
        answer = x * d
      end
    end
  end
end

p answer


puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"