n = gets.to_i
pa = n.times.map { gets.split.map(&:to_i) }
dp = Array.new(n+1){ Array.new(n+1, 0) }
(1..n).each { |l|
  n.downto(1) { |r|
    break if l > r
    score1 = 0
    if r + 1 <= n
      score1 = dp[l][r+1] + ((l..r).include?(pa[r][0]) ? pa[r][1] : 0)
    end

    score2 = 0
    if l - 1 >= 1
      score2 = dp[l-1][r] + ((l..r).include?(pa[l-2][0]) ? pa[l-2][1] : 0)
    end
    score = [score1, score2].max
    dp[l][r] = score
  }
}
pp dp
puts (1..n).map { |i| dp[i][i] }.max
