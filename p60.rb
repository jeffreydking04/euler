require 'prime'
require 'benchmark'

puts Benchmark.realtime() {

primes = Prime.take(1051)
primes.delete(2)
primes.delete(5)

def check(array)
  arr = array.permutation(2).to_a
  flag = true
  arr.each do |pair|
    f = (pair[0].to_s + pair[1].to_s).to_i
    g = (pair[1].to_s + pair[0].to_s).to_i
    flag = false if !f.prime? || !g.prime?
  end
  flag
end

hash = Hash.new
(0...1049).each do |index|
  array = [primes[index]]
  (0...index).each do |i|
    a = (primes[index].to_s + primes[i].to_s).to_i
    b = (primes[i].to_s + primes[index].to_s).to_i
    array << primes[i] if a.prime? && b.prime?
  end

  array.sort!
  hash[primes[index]] = array

  array.each do |num|
    next if primes[index] == num
    a = Array.new
    a = array + hash[num]
    a = a.select{ |e| a.count(e) > 1 }.uniq
    if a.size > 3
      a << primes[index]
      if check(a)
        p a
      end
    end
  end
end
}


