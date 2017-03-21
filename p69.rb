require 'prime'

timer_start = Time.now


primes = Prime.take(50)

answer = 1
index = 0
while answer < 1000000
  answer *= primes[index]
  index += 1
end
answer /= primes[index - 1]
p answer
puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"