n, x, y = gets.split.map(&:to_i)
arr = gets.split.map(&:to_i)
g = Array.new(100000, 0)
100001.times do |i|
  j = (i - x) < 0 ? 100100 : (i - x)
  k = (i - y) < 0 ? 100100 : (i - y)
  g[i] = ([0, 1, 2] - [g[j] || -1, g[k] || -1]).min
end
puts arr.inject(0) { |acc, a| acc ^ g[a] } == 0 ? 'Second' : 'First'
