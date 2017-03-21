value = 0  # Number with largest found repeating part length
max = 0 # Length of the largest found repeating part

(2..1000).each do |x|  # loop through numbers of interest
  array = []          # array to store the remainder each time we do division
  found = false       # flag to indicate whether or not a repeating part has been found
  remainder = 10 % x  # any number that repeats will have a remainder here
  array << remainder  # push the remainder
  while(!found && remainder != 0)  # if the remainder is zero, there is no repeating part
    remainder *= 10                 # add the zero, just like you would doing long division
    remainder = remainder % x       # divide by the number just like long division, getting a new remainder
    found = true if array.include?(remainder) # if that remainder is already in the array, then the pattern between
                                              # the two will repeat exactly as before, so the number of repeating digits
                                              # in the pattern is the distance between the two identical remainders
                                              # so we can trigger the found flag
    array << remainder                        # push the remainder onto the array 
  end
  next if remainder == 0                      # if the remainder was ever zero, it was not a repeating decimal, so on to the next
  indices = array.each_index.select{ |i| array[i] == remainder } # in the case of a repeating decimal, the last index and one
                                                                 # of the previous indexes will equal the last remainder found
                                                                 # we just find the indexes that contain that value
                                                                 # this will return a two element array of the indexes
  difference = indices[1] - indices[0]    # find the difference between the indexes and that is the number of repeating decimals
                                          # for this value
  value = x if difference > max           # if that difference is the greatest found, store the number in value 
  max = difference if difference > max    # and store the difference as the new max
end

puts value                  # number of interest
