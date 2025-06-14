class SegmentTree
  attr_reader :siz

  def initialize(n) # 要素数
    @dat = Array.new(300000, 0)
    @siz = 1
    @siz *= 2 while @siz < n # 要素数から更新
  end

  def update(pos, x) # 本に書いてあるとおり実装
    pos = pos + @siz - 1 #位置計算
    @dat[pos] = x # 更新

    # while (pos/= 2) >= 1 # 木を根に行くまで上がって更新
    #   # pos /= 2
    #   @dat[pos] = [@dat[pos*2], @dat[pos*2+1]].max
    # end

    while pos >= 2
      pos /= 2
      @dat[pos] = @dat[pos*2] + @dat[pos*2+1]
    end
  end

  # [l, r) は求めたい半開区間
  # [a, b) は探索する半開区間
  # u は現在のセル番号
  def query(l, r, a, b, u) # 本に書いてあるとおり実装
    # 終了条件、範囲外
    return 0 if r <= a || b <= l
    # 終了条件、範囲内
    return @dat[u] if l <= a && b <= r

    mid = (a+b) / 2
    answer_l = query(l, r, a, mid, u*2)
    answer_r = query(l, r, mid, b, u*2+1)

    [answer_l, answer_r].sum
  end
end

n, q = gets.split.map(&:to_i)
tree = SegmentTree.new(n)
q.times do
  case gets.split.map(&:to_i)
  in [1, pos, x]
    tree.update(pos, x)
  in [2, l, r]
    puts tree.query(l, r, 1, tree.siz + 1, 1)
  end
end
