n, *a = $<.read.split.map(&:to_i)

dp = Array.new(n, 0)
len = 0
l = []

# dp[i] = i番目までみた時の最長部分増加列の長さ(0-indexed)

n.times do |i|
  pos = l.bsearch_index { |x| x >= a[i] } || l.size
  dp[i] = pos

  if dp[i] >= len
    l << a[i]
    len += 1
  else
    l[dp[i]] = a[i]
  end
end

p len

__END__
(1)
  len = 0
  i = 0
  a[i] = 2
  pos = 0
  dp = [0]
  l = [2]

(2)
  len = 1
  i = 1
  a[i] = 3
  pos = 1
  dp = [0, 1]
  l = [2, 3]

(3)
  len = 2
  i = 2
  a[i] = 1
  dp[2] = 0
  l = [1, 3]

(4)
  len = 2
  i = 3
  a[i] = 6
  dp[3] = 2
  l = [1, 3, 6]

(5)
  len = 3
  i = 4
  a[i] = 4
  dp[4] = 2
  l = [1, 3, 4]

(6)
  len = 3
  i = 5
  a[i] = 5
  dp[5] = 3
  l = [1, 3, 4, 5]




2 3 1 6 4 5


__END__
A  2 3 1 6 4 5

dp 1 2 1 3

(1) 長さ1(2)の部分列の最後の要素2として考えられる最小値2 L[1] = 2
L = [2]

(2) 長さ2(2, 3)の部分列の最後の要素3として考えられる最小値1 L[2] = 3
L = [2, 3]

(3) 長さ1(1)の部分列の最後の要素1として考えられる最小値1 L[1] = 1 ← [2, 1].min
L = [1, 3]

(4) 長さ3(2, 3, 6)の部分列の最後の要素6として考えられる最小値 L[3] = 6
L = [1, 3, 6]

(5) 長さ3(2, 3, 4)の部分列の最後の要素6として考えられる最小値 L[3] = 4 ← [6, 4].min
L = [1, 3, 4]

(6) 長さ4(2, 3, 4, 5)の部分列の最後の要素5として考えられる最小値 L[4] = 5
L = [1, 3, 4, 5]
