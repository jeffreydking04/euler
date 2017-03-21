sum = 0

(1..1000000).each do |x|
  next if x.to_s.reverse != x.to_s
  next if x % 10 == 0
  binary = x.to_s(2).to_i
  next if binary % 10 == 0
  next if binary.to_s.reverse != binary.to_s
  sum += x
end

puts sum