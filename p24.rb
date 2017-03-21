def lexicographic(array, string, term)
  return string if term  == 0
  product = 1
  (1...array.size).each { |x| product *= x}
  index = term / product
  if term % product == 0
    index -= 1
    string << array.delete_at(index)
    array.reverse!
    array.each do |x|
      string << x
    end
    return string
  end
  string << array.delete_at(index)
  term -= product * index
  lexicographic(array, string, term)
end

  array = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  puts lexicographic(array, "", 1000000)