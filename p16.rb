num = (2**1000).to_s
sum = 0
(0...num.length).each do |x|
  sum += num[x].to_i
end

puts sum