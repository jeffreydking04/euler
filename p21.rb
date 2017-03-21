def d(num)
  array = []
  (1..(num/2+1)).each do |x|
    array << x if num % x == 0
  end
  sum = 0
  (0...array.size).each do |x|
    sum += array[x]
  end
  sum
end

array = []

(1..10000).each do |x|
  array << d(x)
end

amicable_array = []

(1..10000).each do |x|
  ((x+1)..10000).each do |y|
    if array[x-1] == y && array[y-1] == x
      amicable_array << x
      amicable_array << y
    end
  end
end
p amicable_array
sum = 0
(0...amicable_array.size).each do |x|
  sum += amicable_array[x]
end
puts sum
