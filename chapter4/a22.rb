n = gets.to_i
a = gets.split.map(&:to_i).map(&:pred)
b = gets.split.map(&:to_i).map(&:pred)

dp = Array.new(n){ -10000000 }
dp[0] = 0
  (0..n-2).each do |i|
  ai = a[i]
  bi = b[i]

  dp[ai] = [dp[i] + 100 , dp[ai]].max
  dp[bi] = [dp[i] + 150 , dp[bi]].max
end

puts dp[n-1]