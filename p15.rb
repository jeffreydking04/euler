def lattice(square)
  grid = Array.new(square+1){Array.new(square+1)}
  
  (0..square).each do |x|
    grid[0][x] = 1
    grid[x][0] = 1
  end
  
  (1..square).each do |x|
    (1..square).each do |y|
      grid[x][y] = grid[x-1][y] + grid[x][y-1]
    end
  end

  return grid[square][square]
end

p lattice(20)

# This solution was easy to code, but only because I reconized the pattern.