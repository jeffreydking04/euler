timer_start = Time.now

hash = {}

(5..12000).each do |x|
  lower = (x * 1.0/3).ceil
  upper = (x * 1.0/2).floor
  (lower..upper).each do |y|

    z = y * 1.0/x
    hash[z] = true if z > 1.0/3 && z < 0.5
  end
end

p hash.size

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"