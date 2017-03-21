timer_start = Time.now

hash = {}
count = 0

def fact(number)
  return 1 if number == 0 || number == 1
  return 2 if number == 2
  return 6 if number == 3
  return 24 if number == 4
  return 120 if number == 5
  return 720 if number == 6
  return 5040 if number == 7
  return 40320 if number == 8
  return 362880 if number == 9
end

def get_next(number)
  sum = 0
  while number > 0
    sum += fact(number % 10)
    number /= 10
  end
  sum
end

(1..1000000).each do |x|
  hash[x] = {}
  hash[x][x] = true
  y = x
  while true
    y = get_next(y)
    break if hash[x][y]
    hash[x][y] = true
  end
  count += 1 if hash[x].size == 60
end

p count

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"