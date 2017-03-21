count = 0
(1..10000).each do |i|
  x = i
  (1..50).each do
    y = x.to_s.reverse.to_i
    x += y
    if x.to_s.reverse == x.to_s
      count += 1
      break
    end
  end
end

p 10000 - count