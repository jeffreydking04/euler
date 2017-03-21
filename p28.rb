sum = 1
current = 1
(1..500).each do |x|
  (1..4).each do |y|
    current += 2*x
    sum += current
  end
end

puts sum