INF = 1001001001

n, m = gets.split.map(&:to_i)
as = gets.split.map(&:to_i).reverse
g = Array.new(2**n) { [] }
m.times do
  x, y, z = gets.split.map(&:to_i).map(&:pred)
  res = 2 ** x + 2 ** y + 2 ** z
  (2**n).times { g[_1].push(_1 ^ res) }
end

dist = Array.new(2**n, INF)
init = as.join.to_i(2)

que = [init]
dist[init] = 0

while v = que.shift
  g[v].each do |u|
    next if dist[u] != INF
    que << u
    dist[u] = dist[v] + 1
  end
end

puts dist[2**n-1] == INF ? -1 : dist[2**n-1]
