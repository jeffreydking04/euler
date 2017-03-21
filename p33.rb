valid_fractions_array = []

(12..99).each do |x|
  (x+1..99).each do |y|
    numerator = x.to_s
    denominator = y.to_s
    next if numerator.reverse == denominator
    numerator = numerator.split("")
    denominator = denominator.split("")
    next if(numerator.include?("0") || denominator.include?("0"))
    next if(numerator[0] == numerator[1] || denominator[0] == denominator[1])
    next if (!denominator.include?(numerator[0]) && !denominator.include?(numerator[1]))
    next if (denominator[0] == numerator[0] || denominator[1] == numerator[1])
    two_digit_result = (1.0 * x) / y
    if(numerator[0] == denominator[1])
      numerator = numerator[1].to_i
      denominator = denominator[0].to_i
    else
      numerator = numerator[0].to_i
      denominator = denominator[1].to_i
    end
    one_digit_result = (numerator * 1.0)/denominator
        if two_digit_result == one_digit_result
     valid_fractions_array << x
     valid_fractions_array << y
   end
  end
end

numerator = 1
denominator = 1

(0...valid_fractions_array.size).each do |x|
  x.even? ? numerator *= valid_fractions_array[x] : denominator *= valid_fractions_array[x]
end
fraction =  "#{numerator}/#{denominator}"
p fraction.to_r