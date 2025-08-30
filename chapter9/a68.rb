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

n, m = gets.split.map(&:to_i)
mf = MaximumFlow.new(n)
m.times do
  a, b, c = gets.split.map(&:to_i)
  mf.add_edge(a-1, b-1, c)
end
p mf.max_flow(0, n-1)
