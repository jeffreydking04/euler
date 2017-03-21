def collatz(count, number)
  if number == 1
    return count
  end

  if (number % 2 == 0)
    number = number / 2
    count +=1
    collatz(count, number)
  else
    number = 3 * number + 1
    count += 1
    collatz(count, number)
  end
end

max = 0
answer = 0

(1..1000000).each do |x|
  terms = collatz(1, x)
  if terms > max
    max = terms
    answer = x
  end
end

puts answer

# Nice little problem here. Start with a number.  If it is even, divide it in half.  If it is odd, multiply by 3 and add 1.  It will eventually get to 1 (or so we believe).  I use recursion and pass the number of times I call the method because that is the number of terms in the chain.  Then we can call it, passing 1 as the initial count.  When the recursion finally passes 1 into method, the method returns the count.  Run it over the first million integers and record the number that returns the largest count.