def divisors(num)
  array = [1]
  i = 2
  begin
    if num % i == 0
      array << i
      array << num / i
    end
    i += 1
  end until i * i > num - 1
  array << i if i * i == num
  array
end


abundant_numbers = []

(12..21000).each do |x|
  array = divisors(x)
  sum = 0
  array.each { |y| sum += y }
  abundant_numbers << x if sum > x
end

sum_array = []

(0...abundant_numbers.size).each do |x|
  (x...abundant_numbers.size).each do |y|
    sum_array << abundant_numbers[x] + abundant_numbers[y]
  end
end

sum_array.sort!
sum_array.uniq!


target_array = []

(1..21000).each do |x|
  target_array << x if !sum_array.include?(x)
end

sum = 0

target_array.each do |x|
  sum += x
end
puts target_array.count
puts sum