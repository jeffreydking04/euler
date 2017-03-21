a = [319,680,180,690,129,620,762,689,762,318,368,710,720,710,629,168,160,689,716,731,736,729,316,729,729,710,769,290,719,680,318,389,162,289,162,718,729,319,790,680,890,362,319,760,316,729,380,319,728,716]

b = a.map { |x| x.to_s }
f = []

while !b.empty?
  c = b.map { |x| x[0] }
  c.uniq!.sort!
  d = b.map { |x| x[1] if x[1] }
  d.delete(nil)
  d.uniq!.sort! if d.size > 1
  e = ""
  c.each do |x|
    e = x if !d.include?(x)
  end
  f << e
  b.each { |x| x.delete!(e) }
  b.delete("")
end
p f.join.to_i