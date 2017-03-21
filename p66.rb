timer_start = Time.now

class SquareRoot
  attr_accessor :root, :period, :cycle, :number
  def initialize(number)
    @number = number
    @root = get_root
    @cycle = get_cycle
    @period = get_period
  end

  def get_root
    (number ** (1.0/2)).floor
  end

  def get_cycle
    array = []
    return array if @root ** 2 == @number
    current = @root
    denom = 1
    const = 0
    begin
      const = denom * current - const
      denom = (@number - const ** 2) / denom
      current = (@root + const) / denom
      array << current
    end while denom != 1
    array
  end

  def get_period
    @cycle.length
  end

  def get_fraction(number)
    array = [@root] + @cycle * number
    array.pop
    num = 1
    denom = array.pop

    while !array.empty?
      num = denom * array.pop + num
      temp = num
      num = denom
      denom = temp
    end

    return [denom, num]
  end
end

max = 0
answer = 0

(2..100000).each do |x|
  next if (x ** (1.0/2)).floor ** 2 == x
  obj = SquareRoot.new(x)
  if obj.period.even?
    potential = obj.get_fraction(1)[0]
  else
    potential = obj.get_fraction(2)[0]
  end
  if potential > max
    max = potential
    answer = x
  end
end

puts answer

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"