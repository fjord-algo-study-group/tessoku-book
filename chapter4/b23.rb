def dist(a, b)
  x1, y1 = a
  x2, y2 = b
  ((x1-x2)**2 + (y1-y2)**2) ** 0.5
end

n = gets.to_i
arr = n.times.map { gets.split.map(&:to_i) }
dp = Array.new(2**16) { Array.new(n, 10**10) }

dp[0][0] = 0
(1<<n).times do |i|
  n.times do |j|
    next if dp[i][j] >= 10**10
    n.times do |k|
      next if i[k] == 1
      dp[i+(1<<k)][k] = [dp[i+(1<<k)][k], dp[i][j] + dist(arr[j], arr[k])].min
    end
  end
end
puts dp[2**n-1][0]
