max_count = 0
max = 0
(1..1000).each do |per|
  count = 0
  (1..per/2).each do |a|
    (1..per/2).each do |b|
        c = (a*a + b*b)**(0.5)
        if a + b + c == per
          count += 1
        end
    end
    max = per if count > max_count
    max_count = count if count > max_count
  end
end
p max