require 'prime.rb'

def number_of_primes(a, b)
  n = 0
  number = b
  while Prime.prime?(number)   
    n += 1
    number = n * n + a * n + b
  end
  return n
end

max = 0
array = [0,0]

(-999..999).each do |b|
  (-999..999).each do |a|
    count = number_of_primes(a, b)
    array = [a,b] if count > max
    max = count if count > max
  end
end

p array

