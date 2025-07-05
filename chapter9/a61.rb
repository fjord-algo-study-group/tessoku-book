n, m = gets.split.map(&:to_i)
list = Array.new(n+1) { [] }
m.times do
  a, b = gets.split.map(&:to_i)
  list[a] << b
  list[b] << a
end
list.each_with_index do |b, i|
  next if i == 0

  puts "#{i}: {#{b.join(', ')}}"
end

__END__
[
  [],        # 0
  [2],       # 1
  [1,3],     # 2
  [2, 4, 5], # 3
  [3],       # 4
  [3],       # 5
]

# 隣接リスト表現
list = Array.new(n) { [] }
m.times do
  a, b = gets.split.map(&:to_i)
  list[a-1] << b-1
  list[b-1] << a-1
end

list.each.with_index(1) do |b, i|
  puts "#{i}: {#{b.map(&:succ).join(', ')}}"
end

# 隣接行列表現
list = Array.new(n) { Array.new(n, 0) }
m.times do
  a, b = gets.split.map(&:to_i)
  list[a-1][b-1] = 1
  list[b-1][a-1] = 1
end
list.each.with_index(1) do |row, i|
  vertices = row.filter_map.with_index(1) { |v, i| i if v == 1}
  puts "#{i}: {#{vertices.join(', ')}}"
end


[
  [0, 1, 0, 0, 0],
  [1, 0, 1, 0, 0],
  [0, 1, 0, 1, 1],
  [0, 0, 1, 0, 0],
  [0, 0, 1, 0, 0],
]

# こうしたらメモリ省エネできるのでは？？　もしくは0b表現の方が良さそみ
[
  "01000",
  "10100",
  "01011",
  "00100",
  "00100",
]
