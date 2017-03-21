timer_start = Time.now

hash = {}
a_hash = {}
w_hash = {}

L = 1500000

(12..L).step(2).each do |x|
  hash[x] = true
end

(12..L).step(2).each do |w|
  p w if w % 1000  == 0
  next if !hash[w]
  count = 0
  (w/2).downto(3).each do |x|    
    (x-1).downto(3).each do |y|
      z = w - x - y
      count += 1 if x ** 2 + y ** 2 == z ** 2
      break if count > 1
    end
    break if count > 1
  end
  if count == 1
    a_hash[w] = true
  end
  if count > 1
    w_hash[w] = true
    j = w
    while j < L
      hash[j] = false
      j += w
    end
  end
end
count = 0

a_hash.each do |key, value|
  count += 1 if value == true
end

p count

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"