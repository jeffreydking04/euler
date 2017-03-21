hash = {}

found = false
current = 1

while !found
  cube = (current ** 3).to_s.split("").to_a.sort.join
  if !hash[cube]
    hash[cube] = { count: 0, cubes: [] }
  end
  hash[cube][:count] = hash[cube][:count] + 1
  hash[cube][:cubes] << current ** 3
  if hash[cube][:count] == 3
    p hash[cube][:cubes][0]
    found = true
  end
  current += 1
end

# This one is a little bit cheating because I stop once one is found, without checking to be sure that there are exactly 5 permutations, but that would be a trivial fix, compared to the difficulty of the problem.  
