product = 1
(1..100).each do |x|
  product = product * x
end 

str = product.to_s


sum = 0

(0...str.length).each do |x|
  sum += str[x].to_i
end

puts sum