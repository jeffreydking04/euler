timer_start = Time.now

hash = {}

L = 1500000
root = (L ** 0.5).ceil

root.downto(2).each do |x|
  (x-1).downto(1).each do |y|
    if (x + y) % 2 == 1 && x.gcd(y) == 1
      a = x ** 2 - y ** 2
      b = 2 * x * y
      c = x ** 2 + y ** 2
      p = a + b + c
      j = p
      while j <= L
        hash[j] ||= 0
        hash[j] += 1
        j += p
      end
    end
  end
end

count = 0

hash.each do |key, value|
  count += 1 if value == 1
end


puts count

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"