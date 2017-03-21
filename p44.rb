timer_start = Time.now

# pentagonal_numbers_array = []
# 
# (1..5000).each do |x|
#   pentagonal_numbers_array << x * (3 * x -1) / 2
# end
# 
# answer_array = []
# 
# (1..2500).each do |x|
#   p x if x % 100 == 0
#   (x+1..2500).each do |y|
#     num1 = x * (3*x-1)/2
#     num2 = y * (3*y-1)/2     
#     add = num1 + num2
#     sub = num2 - num1
#     if pentagonal_numbers_array.include?(add) && pentagonal_numbers_array.include?(sub)
#       answer_array << x
#       answer_array << y
#       p num1
#       p num2
#     end
#   end
# end
# 
# p answer_array

answer_array = []

(1..2500).each do |x|
  (x+1..2500).each do |y|
    num1 = x * (3*x-1)/2
    num2 = y * (3*y-1)/2     
    add = num1 + num2
    sub = num2 - num1
    decimal_add = (0.5+(0.25+6*add)**(0.5))/3
    decimal_sub = (0.5+(0.25+6*sub)**(0.5))/3

    if decimal_add == decimal_add.to_i && decimal_sub == decimal_sub.to_i
      answer_array << num1
      answer_array << num2
    end
  end
end

p answer_array[1] - answer_array[0]






puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"