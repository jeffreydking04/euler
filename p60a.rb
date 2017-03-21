require 'prime'

primes = Prime.take(1100)

array = primes.permutation(2).to_a

def check(array)
  arr = Array.new
  flag = true
  ar = array.permutation(2).to_a
  ar.each do |pair|
    a = (pair[0].to_s + pair[1].to_s).to_i
    b = (pair[1].to_s + pair[0].to_s).to_i
    flag = false if !a.prime? || !b.prime?
  end
  flag
end

pairs = Array.new

array.each do |pair|
  a = (pair[0].to_s + pair[1].to_s).to_i
  b = (pair[1].to_s + pair[0].to_s).to_i
  pairs << pair if a.prime? && b.prime?
end

pairs.each { |pair| pair.sort! }
pairs.uniq!

pairs = pairs.select { |e| e[0] < 20 }

trips = Array.new

pairs.each do |pair|
  primes.each do |prime|
    next if prime <= pair[1]
    clone = pair.dup
    clone << prime
    trips << clone if check(clone)
  end
end

trips.each { |trip| trip.sort! }
trips.uniq!


quads = Array.new
trips.each do |trip|
  primes.each do |prime|
    next if prime <= trip[2]
    clone = trip.dup
    clone << prime
    quads << clone if check(clone)
  end
end

quints = Array.new

quads.each do |quad|
  primes.each do |prime|
    next if prime <= quad[3]
    clone = quad.dup
    clone << prime
    quints << clone if check(clone)
  end
end

p quints