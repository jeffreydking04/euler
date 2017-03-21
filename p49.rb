timer_start = Time.now

require 'mathn'

(1000..3400).each do |x|
  next if !Prime.prime?(x)
  y = x + 3330
  z = y + 3330
  next if x.to_s.split("").sort != y.to_s.split("").sort || x.to_s.split("").sort != z.to_s.split("").sort
  p x if Prime.prime?(y) && Prime.prime?(z) && x != 1487
end

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"