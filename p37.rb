require 'mathn' 

answer_array = []

Prime.each(1000000) do |prime|
  next if prime < 10
  str = prime.to_s
  new_str = str
  another_str = str
  truncatable = true

  (1...str.length).each do
    new_str = new_str[1..-1]
    truncatable = false if !Prime.prime?(new_str.to_i)
    another_str[-1] = ""
    truncatable = false if !Prime.prime?(another_str.to_i)
  end
  next if !truncatable
  answer_array << prime
end

sum = 0
answer_array.each { |x| sum += x }
p sum