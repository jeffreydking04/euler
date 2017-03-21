# def factors_of(number) 
#   array = [1]
#   array2 = [number]
#   i = 2
#   begin
#     if number % i == 0
#       array << i
#       array2 << number / i
#     end
#     i += 1
#   end until i * i > number
#   (array + array2.reverse).uniq
# end

def number_of_factors(number)
  count = 2
  i = 2
  begin
    count += 2 if number % i == 0
    i += 1
  end until i * i > number - 1
  count += 1 if i * i == number
  count
end

current_triangle_number = 1
iteration = 1
divisors_count = 1

while(divisors_count < 501)
  iteration += 1
  current_triangle_number += iteration
  divisors_count = number_of_factors(current_triangle_number)
end

puts current_triangle_number

# see Euler Project #12 for explanation of triangular number (basically sum of
# all numbers from 1 up to a given number, so trian_num(4) = 10)  I
# did a number of brute force methods that took a while, before refining the 
# way I found the factorization to the commented out method.
# I then realized I was pushing to arrays in twos and then subtracting off
# a duplicate if the number was a perfect square, so I wrote a method
# that did not return an array, but just the count.  I started with the obvious 
# two for all numbers greater than 1 and then found all pairs with a factor below
# the square root of the number, and simply added two to the count for each one found.
# Lastly I added 1 to the count if the number was a perfect square.  Then I iterated
# through the triangular numbers until one of thier factor_counts was greater than 500.
