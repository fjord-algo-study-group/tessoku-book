# 入力の受け取り
n = gets.to_i
a = ([0] * 2) + gets.split.map(&:to_i)
b = ([0] * 3) + gets.split.map(&:to_i)

# DPテーブルの初期化
dp = Array.new(n+1, 0)

# 動的計画法
dp[2] = dp[1] + a[2]

(3..n).each do |i|
  dp[i] = [
    dp[i-1] + a[i],
    dp[i-2] + b[i]
  ].min
end

# 経路復元
ans = []
now = n

while true
  break ans << 1 if now == 1

  ans << now
  if dp[now] == dp[now-1] + a[now]
    now -= 1
  elsif dp[now] == dp[now-2] + b[now]
    now -= 2
  end
end

puts ans.size
puts ans.reverse.join(' ')
__END__
5
0 1 2 3 4 5
0 0 2 4 1 3
0 0 5 3 3
