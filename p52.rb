timer_start = Time.now
answer = 0
(1..10000000).each do |x1|
  p x1 if x1 % 100000 == 0
  x2 = 2 * x1
  x3 = 3 * x1
  x4 = 4 * x1
  x5 = 5 * x1
  x6 = 6 * x1
  p "#{x1}, #{x2}, #{x3}, #{x4}, #{x5}, #{x6}"
  x1 = x1.to_s.chars.sort
  x2 = x2.to_s.chars.sort
  x3 = x3.to_s.chars.sort
  x4 = x4.to_s.chars.sort
  x5 = x5.to_s.chars.sort
  x6 = x6.to_s.chars.sort
  next if x1 != x2
  p x2
  next if x1 != x3
  next if x1 != x4
  next if x1 != x5
  next if x1 != x6
  answer = x1
  break
end
p answer.join("").to_i if answer != 0

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"