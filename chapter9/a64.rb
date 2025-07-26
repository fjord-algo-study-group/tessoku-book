class PriorityQueue
  attr_reader :size

  def initialize(&compare)
    @heap = [nil]
    @size = 0

    # 要素の比較方法(デフォルト: min_heap(昇順))
    compare ||= ->(x, y) { x <=> y }
    @comp =
      case compare.arity
      when 1 then ->(x, y) { compare[x] <=> compare[y] }
      when 2 then compare
      else raise ArgumentError
      end
  end

  def <<(obj)
    @heap << obj
    @size += 1

    # 葉から根へ正しい順序に付け替える
    k = @size
    while (k >>= 1) > 0 && update(k); end

    # queue << obj1 << obj2 と連続できるようselfを返す
    self
  end

  def shift
    return nil if empty?
    return @heap.pop.tap { @size -= 1 } if @size == 1

    result = @heap[1]
    @heap[1] = @heap.pop

    # 葉から根へ正しい順序に付け替える
    k = 1
    while (k = update(k)); end

    result.tap { @size -= 1 }
  end

  def first
    @heap[1]  # 要素が無ければnil
  end

  def empty?
    @size == 0
  end

  private

  # 位置kとその子ノードの間で順序を正す
  # 入れ替えたら子のインデックスを、入れ替えなかったらnilを返す
  def update(k)
    l, r = k << 1, k << 1 | 1
    up, left, right = @heap.values_at(k, l, r)
    return nil unless left  # 子が無い

    # 左右の子ノードのうち値が小さいほうが交換候補
    if right && @comp[left, right] > 0
      return nil if @comp[up, right] <= 0

      @heap[k], @heap[r] = right, up
      r
    else
      return nil if @comp[up, left] <= 0

      @heap[k], @heap[l] = left, up
      l
    end
  end
end

n, m = gets.split.map(&:to_i)
arr = m.times.map { gets.split.map(&:to_i) }
cur = Array.new(n, Float::INFINITY)
cur[0] = 0
kakutei = Array.new(n, false)

list = Array.new(n) { [] }
arr.each do |a, b, c|
  list[a-1] << [b-1, c]
  list[b-1] << [a-1, c]
end

# [距離、頂点]
pq = PriorityQueue.new { |x| x.first }
pq << [0, 0]

while (_, pos = pq.shift)
  next if kakutei[pos]

  kakutei[pos] = true

  list[pos].each do |v, d|
    next if kakutei[v]

    if cur[pos] + d < cur[v]
      cur[v] = cur[pos] + d
      pq << [cur[v], v]
    end
  end
end

puts cur.map { |v| v == Float::INFINITY ? -1 : v }

__END__
# 愚直版

n, m = gets.split.map(&:to_i)
arr = m.times.map { gets.split.map(&:to_i) }
cur = Array.new(n, Float::INFINITY)
cur[0] = 0
kakutei = Array.new(n, false)

list = Array.new(n) { [] }
arr.each do |a, b, c|
  list[a-1] << [b-1, c]
  list[b-1] << [a-1, c]
end

n.times do
  # 未確定の頂点の中で距離(cur[x])が最小の頂点を次に訪れる
  kakutei_idx = kakutei.filter_map.with_index { |v, i| i unless v }
  pos = cur.filter_map.with_index { |v, i| [v, i] if kakutei_idx.include?(i) }.min_by(&:first).last
  kakutei[pos] = true

  list[pos].each do |v, d|
    next if kakutei[v]

    if cur[pos] + d < cur[v]
      cur[v] = cur[pos] + d
    end
  end
end

puts cur.map { |v| v == Float::INFINITY ? -1 : v }
