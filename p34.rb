def factorial(x)
  product = 1
  (2..x).each do |y|
    product *= y
  end
  product
end
answers = []
(10..1000000).each do |x|
  array = x.to_s.split("").map { |y| factorial(y.to_i) }
  sum = 0
  array.each { |y| sum += y }
  answers << x if sum == x
end

p answers