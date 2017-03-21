timer_start = Time.now

answer = 0
flag = false
(286..100000).each do |t|
  t_num = t * (t+1)/2
  pent = (0.5+(0.25+6*t_num)**(0.5))/3
  h = (0.5 + (2*t_num + 0.25)**(0.5))/2
  if pent == pent.to_i && h == h.to_i
    answer = t_num
    flag = true
  end
  break if flag
end

p answer



puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"