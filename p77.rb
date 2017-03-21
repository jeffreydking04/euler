timer_start = Time.now

require 'prime'

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
    return 0 if index == 0 && total % @values[0] != 0
    return 1 if index == 0
    count(total - @values[index], index) + count(total, index - 1)
  end
end

values = Prime.take(20)


answer = 0

find_states = StateCounter.new(values)
(50..500).each do |x|
  z = find_states.get_states(x)
  if z > 5000
    p x
    answer = x
    break
  end
end

p find_states.get_states(answer)


puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"