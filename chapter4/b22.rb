INF = 1001001001
n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

dp = Array.new(n+1, INF)
dp[1] = 0

(1...n).each do |i|
  # 遷移
  # 部屋iからi+1への遷移
  dp[i+1] = [dp[i+1], dp[i] + a[i-1]].min

  # 部屋iからi+2への遷移
  dp[i+2] = [dp[i+2], dp[i] + b[i-1]].min if i <= n-2
end

p dp[n]

__END__
# A
 0     1    2          n-1
1→2 , 2→3, 3→4, ...,  n→n+1
# B
 0    1    2          n-1
1→3, 2→4, 3→5, ... , n→n+2
