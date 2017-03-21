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
end

array = []

(1..10000).each do |x|
  array << SquareRoot.new(x)
end
count = 0
array.each do |y|
  count += 1 if !y.period.even?
end
p count

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"