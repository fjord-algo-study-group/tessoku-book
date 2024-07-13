n = gets.to_i
h = gets.split.map(&:to_i).unshift(0)

dp = Array.new(n+1,0)
dp[2] = (h[2] -h[1]).abs + dp[1]


(3..n).each do |i|
  dp[i] = [
    # １つジャンプ
    (h[i] - h[i-1]).abs + dp[i-1],
    # 2つジャンプ
    (h[i] - h[i-2]).abs + dp[i-2]
  ].min
end

now = n
ans = []
while
  ans << now
  if dp[now] == dp[now-1] + (h[now] - h[now-1]).abs
    now -= 1
  else
    now -= 2
  end
  break ans << 1 if now == 1
end
puts ans.size
puts ans.reverse.join(' ')




__END__
