timer_start = Time.now

digits_array = [3,1,2,0,4,5,6,7,8,9]
prime_array = [1,2,3,5,7,11,13,17]  # I know; it made indexing nicer.

permutations_array = digits_array.permutation.to_a(10)
valid_number_array =[]

sum = 0

permutations_array.each do |x|
  valid = true
  (1..7).each do |y|
    valid = false if !(x[y..y+2].join.to_i % prime_array[y] == 0)
    break if !valid
  end

  sum += x.join.to_i if valid
end

puts sum

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"