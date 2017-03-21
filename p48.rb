timer_start = Time.now

sum = 0

(1..1000).each do |x|
  sum += x ** x
end

sum = sum.to_s
sum.reverse!

puts sum[0..9].reverse

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"


# Ruby made this one trivial.  An alternate solution is only adding the last ten digits of each
# square.