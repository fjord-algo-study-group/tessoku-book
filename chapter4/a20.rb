s = gets.chomp
t = gets.chomp

dp = Array.new(2001){Array.new(2001){0}}

(1..s.size).each do |i|
  (1..t.size).each do |j|
    if s[i-1] == t[j-1]
      dp[i][j] = [dp[i-1][j-1]+1,dp[i-1][j],dp[i][j-1]].max
    else
      dp[i][j] = [dp[i-1][j],dp[i][j-1]].max
    end
  end
end

puts dp[s.size][t.size]
