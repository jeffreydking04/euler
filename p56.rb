def digital_sum(x)
  x = x.to_s
  sum = 0
  (0...x.length).each { sum += x.slice!(0).to_i}
  sum
end

max = 0

(2...100).each do |a|
  (2..100).each do |b|
    result = a ** b
    result = digital_sum(result)
    max = result if result > max
  end
end

p max