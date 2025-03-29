n = gets.to_i
m = n.times.map { gets.split.map(&:to_i) }
q = gets.to_i
o = Array.new(n) { [_1] * 2 }.to_h

q.times do
  case gets.split.map(&:to_i).map(&:pred)
  in [0, x, y]
    o[x], o[y] = o[y], o[x]
  in [1, x, y]
    puts m[o[x]][y]
  end
end

__END__
[0,3,2,1,4]
インデックス →　元の行
要素 →　遷移先の行

{
  0 => 0,
  1 => 1,
  2 => 2,
  ...
}

key → もとの行
value → 遷移先の行

Array.new(n, &:itself)

1 1 2
1 2 3

1 → 2
2 → 3
3 → 1


1 3
2 1
3 2


[1] * 3
→ [1, 1, 1]
