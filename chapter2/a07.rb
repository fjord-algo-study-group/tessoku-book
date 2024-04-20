d = gets.to_i
n = gets.to_i

lr = n.times.map do |i|
  gets.split.map(&:to_i)
end

# 増減表を作る(O(D))
updown = [0] * (d + 1) # d + 1にしないと d = 1 r = 1 の時などでバグる
lr.each do |l, r|
  updown[l - 1] += 1
  updown[r] -= 1
end

ans = 0
# 累積和を求める
d.times do |i|
  puts ans += updown[i]
end

__END__
updown[l-1]
updown[r]

ex1)
8
5
2 3
3 6
5 7
3 7
1 5
