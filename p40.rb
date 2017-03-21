d= ""
(0..186000).each do |x|
  d = d + x.to_s
end

product = 1
(0..6).each do |x|
  product *= d[10**x].to_i
end

p product