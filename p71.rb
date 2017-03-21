target = 3.0/7
min = 1.0
answer = 0
ans = 0

(1..1000000).each do |x|
  y = (target * x).floor
  next if y * 1.0 / x == target
  z = target - y * 1.0/x
  if z < min
    min = z
    answer = y
    ans = x
  end
end

p answer