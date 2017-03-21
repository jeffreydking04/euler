timer_start = Time.now

require 'mathn'

answer = 0
(9..9999).step(2).each do |x|
  next if Prime.prime?(x)
  found = false
  (2..x).each do |y|
    next if !Prime.prime?(y)
    (1..x).each do |z|
      break if 2 * z**2 + y > x
      found = true if y + 2 * z**2 == x
    end
  end
  if !found
    answer = x
    break
  end
end

p answer


puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"