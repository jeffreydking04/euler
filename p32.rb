pandigital_numbers_array = []
(1..10000).each do |x|
  string = x.to_s.split("").uniq
  next if string.include?("0")
  string = string.join("")
  pandigital_numbers_array << string.to_i if string == x.to_s
end

valid_products_array = []

(0..pandigital_numbers_array.size).each do |x|
  (x..pandigital_numbers_array.size).each do |y|
    z = x * y
    string = z.to_s + x.to_s + y.to_s
    valid_products_array << z if string == string.split("").uniq.join("") && string.length == 9 && !string.include?("0")
  end
end
p valid_products_array
sum = 0
valid_products_array.uniq.each { |x| sum += x }
puts sum