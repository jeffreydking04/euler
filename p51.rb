timer_start = Time.now

require 'mathn'
  answer = 0
(1..1000000).each do |x|
  next if !Prime.prime?(x)
  x_array = x.to_s.split("")
  next if !x_array.include?("0")  & !x_array.include?("1") && !x_array.include?("2")
  count = 1
  int = 0
  a = x_array.pop
  if x_array.include?('0')
    indices = []
    (0...x_array.size).each { |y| indices << y if x_array[y] == "0" }
    new_array = x_array
    (1..9).each do |y|
      (0...indices.size).each do |z|
        new_array[indices[z]] = y.to_s
      end
      int = (new_array.join("") + a).to_i
      count += 1 if Prime.prime?(int)
    end
    answer = x if count == 8
    break if count == 8
    count = 1
  end
  if x_array.include?('1')
    indices = []
    (0...x_array.size).each { |y| indices << y if x_array[y] == "1" }
    new_array = x_array
    (2..9).each do |y|
      (0...indices.size).each do |z|
        new_array[indices[z]] = y.to_s
      end
      int = (new_array.join("") + a).to_i
      count += 1 if Prime.prime?(int)
    end
    answer = x if count == 8
    break if count == 8
    count = 1
  end
  if x_array.include?('2')
    indices = []
    (0...x_array.size).each { |y| indices << y if x_array[y] == "2" }
    new_array = x_array
    (3..9).each do |y|
      (0...indices.size).each do |z|
        new_array[indices[z]] = y.to_s
      end
      int = (new_array.join("") + a).to_i
      count += 1 if Prime.prime?(int)
    end
    answer = x if count == 8
    break if count == 8
  end
end
p answer
puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"