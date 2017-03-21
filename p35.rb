require 'prime.rb'

answer_array = [2]

(3..999999).each do |x|
  array = x.to_s.chars
  next if array.include?("0") ||
          array.include?("2") ||
          array.include?("4") ||
          array.include?("6") ||
          array.include?("8") 
  next if !Prime.prime?(x)
  circular_array = []
  (0...array.size).each do |y|
    temp = array.delete_at(0)
    array << temp
    circular_array << array.join("")
  end
    circular_array = circular_array.map { |i| i.to_i}
    prime_array = circular_array.map { |y| Prime.prime?(y) }
    prime_array.uniq!
    answer_array << x if prime_array.count == 1 && prime_array[0] == true
end
p answer_array
p answer_array.count
