array = []

(2..100).each do |x|
  (2..100).each do |y|
    array << x ** y
  end
end

puts array.uniq.count