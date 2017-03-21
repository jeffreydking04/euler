require 'numbers_in_words'

sum = 0

(1..1000).each do |x|
  sum += NumbersInWords.in_words(x).delete(" ").length
end
puts sum


# This one was instructive mostly because I got refamiliarized with gems.  I could
# have written a form of the gem myself, but use your tools and understand what they do.