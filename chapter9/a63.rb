n, m = gets.split.map(&:to_i)
arr = m.times.map { gets.split.map(&:to_i) }
list = Array.new(n) { [] }
dist = Array.new(n, -1)
dist[0] = 0
arr.each do |a, b|
  list[a-1] << b-1
  list[b-1] << a-1
end
qs = [0]
while !qs.empty?
  q = qs.shift
  d = dist[q]
  list[q].each do |i|
    if dist[i] < 0
      qs << i
      dist[i] = d + 1
    end
  end
end
puts dist
