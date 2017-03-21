timer_start = Time.now

array = [1]
mod = 1
index = 1

while mod != 0
  current = 1
  array[index] = 0
  count = 0
  m = 1
  while index - current >= 0
    if count % 4 == 1 || count % 4 == 0
      array[index] += array[index - current]
    else
      array[index] -= array[index - current]
    end
    count += 1
    if m == 0
      m = 1
    else
      m = -m
      m += 1 if m > 0
    end
    current = (3 * m * m - m)/2
  end
  mod = array[index] % 1000000
  index += 1
end

p array.size - 1
p array.last
puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"