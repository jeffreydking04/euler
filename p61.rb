tris = []
squs = []
pens = []
hexs = []
heps = []
octs = []

(0..200).each do |x|
  tris << x * (x + 1) / 2
  squs << x**2
  pens << x * (3 * x - 1) / 2
  hexs << x * (2 * x - 1)
  heps << x * (5 * x - 3) / 2
  octs << x * (3 * x - 2)
end

tris = tris.select { |e| e > 999 && e < 10000 }
squs = squs.select { |e| e > 999 && e < 10000 }
pens = pens.select { |e| e > 999 && e < 10000 }
hexs = hexs.select { |e| e > 999 && e < 10000 }
heps = heps.select { |e| e > 999 && e < 10000 }
octs = octs.select { |e| e > 999 && e < 10000 }

tris.map! { |e| e.to_s }
squs.map! { |e| e.to_s }
pens.map! { |e| e.to_s }
hexs.map! { |e| e.to_s }
heps.map! { |e| e.to_s }
octs.map! { |e| e.to_s }

  #puts "tris: #{tris}"
  #puts "squs: #{squs}"
  #puts "pens: #{pens}"
  #puts "hexs: #{hexs}"
  #puts "heps: #{heps}"
  #puts "octs: #{octs}"

array = [tris,squs,pens,hexs,heps,octs]
array = array.permutation(6).to_a
array = array.select { |a| a[0] == octs }

hash = Hash.new
count = 0

def search_next(num, hash, round, count, permutation, root)
  p hash[count][root] if round == 5 && hash[count][root][0][0..1] == hash[count][root][5][2..3]
  return if round == 5
  round += 1
  suffix = num[2..3]
  permutation[round].each do |number|
    if number[0..1] == suffix
      hash[count][root] << number
      search_next(number, hash, round, count, permutation, root)
    end
  end
end

array.each do |permutation|
  hash[count] = Hash.new
  permutation[0].each do |number|
    round = 0
    root = number
    hash[count][number] = [number]
    search_next(number, hash, round, count,permutation, root)
  end
  count += 1
end

ha = [1281, 8128, 2882, 8256, 5625, 2512]

puts ha.inject(0) { |sum, x| sum + x }