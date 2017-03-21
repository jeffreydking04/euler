array = []
(2..10000000).each do |x|
  string = x.to_s
  sum = 0
  (0..string.length).each do |y|
    sum += string[y].to_i ** 5
  end
  array << x if x == sum
end
sum = 0
array.each { |x| sum += x }
puts sum