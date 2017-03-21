timer_start = Time.now

#limit = 100
#array = Array.new(limit + 1, 0)
#array[0] = 1
# 
#(1...limit).each do |i|
#  (i..limit).each do |j|
#    array[j] = array[j] + array[j - i];
#  end
#end
#
#puts array[limit]

class StateCounter
  def initialize(values = [1])
    @values = values
  end

  def get_states(total)
    count(total, @values.size - 1)
  end

  private

  def count(total, index)
    return 0 if total < 0
    return 1 if index == 0
    count(total - @values[index], index) + count(total, index - 1)
  end
end

values = []
(1..99).each { |x| values << x }

find_states = StateCounter.new(values)
p find_states.get_states(100)


puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"