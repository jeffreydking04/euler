numerators = [0]
denominators = [1]

(0...1000).each do |x|
  numerators << denominators[x]
  denominators << 2 * denominators[x] + numerators[x]
end

(0...1001).each do |x|
  numerators[x] += denominators[x]
end

count = 0

(0...1001).each do |i|
  count += 1 if numerators[i].to_s.length > denominators[i].to_s.length
end

puts count