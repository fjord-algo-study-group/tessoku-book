n, m = gets.split.map(&:to_i)
list = Array.new(n) { [] }

m.times do
  a, b = gets.split.map(&:to_i)
  list[a-1] << b-1
  list[b-1] << a-1
end

visited = Array.new(n, false)

stack = [0]
visited[0] = true

while pos = stack.pop
  list[pos].each do |nex|
    next if visited[nex]

    visited[nex] = true
    stack << nex
  end
end

puts visited.all? ? "The graph is connected." : "The graph is not connected."

__END__
# メソッド版
n, m = gets.split.map(&:to_i)
list = Array.new(n) { [] }
m.times do
  a, b = gets.split.map(&:to_i)
  list[a-1] << b-1
  list[b-1] << a-1
end
visited = Array.new(n, false)

def dfs(pos, visited, list)
  visited[pos] = true

  list[pos].each do |nex|
    dfs(nex, visited, list) unless visited[nex]
  end
end

dfs(0, visited, list)
puts visited.all? ? "The graph is connected." : "The graph is not connected."

# lambda版
n, m = gets.split.map(&:to_i)
list = Array.new(n) { [] }
m.times do
  a, b = gets.split.map(&:to_i)
  list[a-1] << b-1
  list[b-1] << a-1
end
visited = Array.new(n, false)

dfs = -> (pos) {
  visited[pos] = true

  list[pos].each do |nex|
    dfs.call(nex) unless visited[nex]
  end
}

dfs.call(0)
puts visited.all? ? "The graph is connected." : "The graph is not connected."
