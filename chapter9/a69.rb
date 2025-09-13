class MaximumFlow
  Edge = Struct.new(:to, :cap, :rev)

  def initialize(size)
    @g = Array.new(size) { [] } # 隣接リスト
    @used = Array.new(size, false)
  end

  def max_flow(start, goal)
    total_flow = 0

    loop do
      @used = Array.new(@g.size, false)

      f = dfs(start, goal)

      break if f.zero?
      total_flow += f
    end

    total_flow
  end

  def add_edge(from, to, cap)
    current_gfrom = @g[from].size
    current_gto = @g[to].size
    @g[from] << Edge.new(to, cap, current_gto)
    @g[to] << Edge.new(from, 0, current_gfrom)
  end

  def dfs(pos, goal, max = Float::INFINITY)
    return max if (pos == goal)
    @used[pos] = true

    @g[pos].each do |edge|
      next if edge.cap.zero?
      next if @used[edge.to]

      flow = dfs(edge.to, goal, [max, edge.cap].min)

      next if flow.zero?

      edge.cap -= flow
      @g[edge.to][edge.rev].cap += flow

      return flow
    end

    0
  end
end

n = gets.to_i
arr = n.times.map { gets.chomp.chars }
mf = MaximumFlow.new(2*n+2)
n.times do |i|
  n.times do |j|
    next if arr[i][j] == '.'

    mf.add_edge(i, n+j, 1)
  end
end

n.times do |i|
  mf.add_edge(2*n, i, 1)
  mf.add_edge(n+i, 2*n+1, 1)
end

p mf.max_flow(2*n, 2*n+1)
