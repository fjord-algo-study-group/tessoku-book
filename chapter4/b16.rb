n = gets.to_i
h = gets.split.map(&:to_i)
dp = Array.new(n+1, 0)
dp[2] = (h[1] - h[0]).abs
3.upto(n) { |i|
  dp[i] = [(h[i-1] - h[i-2]).abs + dp[i-1], (h[i-1] - h[i-3]).abs + dp[i-2]].min
}
puts dp[n]
