count = 0
(1..9).each do |x|
  (1..100).each do |y|
    count += 1 if y == (x ** y).to_s.length
  end
end

p count