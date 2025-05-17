# TLE
q = gets.to_i
arr = q.times.map { gets.split.map(&:to_i) }
tmp = []
arr.each do |query, x|
  case query
  when 1
    tmp << x
    tmp.sort!
  when 2
    i = tmp.bsearch_index{ x <=> _1 }
    tmp.delete_at(i)
  when 3
    puts tmp.bsearch { _1 >= x } || -1
  end
end

__END__
# テストケース作った
100000.times do puts [[*1..3].sample, rand(10**9)] * ' ' end

# ChapGPT案　普通に間に合いそう
## 二分探索用メソッド（lower bound index を返す）
def lower_bound(array, x)
  left = 0
  right = array.size
  while left < right
    mid = (left + right) / 2
    if array[mid] < x
      left = mid + 1
    else
      right = mid
    end
  end
  left
end

q = gets.to_i
cards = []
q.times do
  query = gets.split.map(&:to_i)
  type, x = query

  case type
  when 1
    idx = lower_bound(cards, x)
    cards.insert(idx, x)
  when 2
    idx = lower_bound(cards, x)
    cards.delete_at(idx)
  when 3
    idx = lower_bound(cards, x)
    if idx < cards.size
      puts cards[idx]
    else
      puts -1
    end
  end
end
