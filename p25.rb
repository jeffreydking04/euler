len = 0 
fib1 = 1
fib2 = 2
count = 3

while len < 1000
  count += 1 
  temp = fib2
  fib2 += fib1
  fib1 = temp
  len = fib2.to_s.length
end

p count