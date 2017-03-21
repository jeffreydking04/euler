sum = 0
(1...31).each do |number|
  if number % 3 == 0 || number % 5 == 0
    sum = sum + number
  end
end

puts sum