def fibonacci(fib_number1, fib_number2, sum)
  if fib_number2 < 4000000
    sum += fib_number2 if fib_number2 % 2 == 0
  else
    return sum
  end
  temp = fib_number2
  fib_number2 += fib_number1
  fib_number1 = temp
  fibonacci(fib_number1, fib_number2, sum)
end

puts fibonacci(1, 2, 0)

