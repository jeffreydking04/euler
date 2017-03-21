timer_start = Time.now

array = [1,2,3,4,5,6,7,8,9,10]

arr = []

(1..6).each do |x|
  a = array.dup
  a.delete(x)

  a = a.permutation(a.size).to_a
  a.each do |y|
    arr << [x] + y
  end
end
arr.reverse!
arr = arr.select {|x| x[4] == 10 || x[3] == 10 || x[2] == 10 || x[1] == 10 || x[0] == 10 }

answer = []

arr.each do |a|
  b = a[0] + a[5] + a[6]
  c = a[1] + a[6] + a[7]
  d = a[2] + a[7] + a[8]
  e = a[3] + a[8] + a[9]
  f = a[4] + a[9] + a[5]
  if b == c &&  b == d && b == e && b == f
    answer = [a[0]] + [a[5]] + [a[6]] + [a[1]] + [a[6]] + [a[7]] + [a[2]] + [a[7]] + [a[8]] + [a[3]] + [a[8]] + [a[9]] + [a[4]] + [a[9]] + [a[5]]
    break
  end
end

puts answer.join.to_i

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"