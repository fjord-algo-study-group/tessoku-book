INF = 1001001001
SIZE = 100003
n, w = gets.split.map(&:to_i)
wv = Array.new(n) { gets.split.map(&:to_i) }

dp = Array.new(n+1) { Array.new(SIZE, INF) }
dp[0][0] = 0

n.times do |i|
  wi, vi = wv[i]
  SIZE.times do |j|
    next if dp[i][j] == INF

    dp[i+1][j] = [
      dp[i+1][j],
      dp[i][j]
    ].min

    if j + vi < SIZE
      dp[i+1][j+vi] = [
        dp[i+1][j+vi],
        dp[i][j] + wi
      ].min
    end
  end
end
ans = 0

SIZE.times do |i|
  ans = i if dp[-1][i] <= w
end

p ans

