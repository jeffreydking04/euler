max = 0


(1..100000).each do |x|
  (2..10).each do |y|
    concat = ""
    (1..y).each do |z|
      concat = concat + (x*z).to_s
    end
    next if concat.length != 9
    concat_array = concat.split('')
    next if concat_array.include?("0")
    concat_array.uniq!
    next if concat_array.size != 9
    max = concat_array.join('').to_i if concat_array.join("").to_i > max

  end
end

p max