require 'prime'

count = 1
current = 1
primes = 0
skip = 2
(1..200000).each do |x|
  (1..4).each do
    current = current + skip
    primes += 1 if current.prime?
  end
  skip += 2
  count += 4
  puts "#{x}: #{primes.to_f/count.to_f}"
  if primes.to_f/count.to_f < 0.1
    puts x
    break
  end
end
 