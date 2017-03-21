array = [2,1,2]
current = 4
(3..99).each do |index|
  if index % 3  == 2
    array << current
    current += 2
  else
    array << 1
  end
end

num = 1
denom = array.pop

while !array.empty?
  num = denom * array.pop + num
  temp = num
  num = denom
  denom = temp
end

answer = denom.to_s.split('')
answer = answer.map { |x| x.to_i }
answer = answer.inject(0) { |sum, x|  sum + x }

p answer