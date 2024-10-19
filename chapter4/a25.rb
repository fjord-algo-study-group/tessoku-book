h, w = gets.split.map(&:to_i)
c = Array.new(h) { gets.chars }

dp = Array.new(h+1) { [0] * (w+1) }
dp[1][1] = 1

1.upto(h) do |i|
  1.upto(w) do |j|
    next if i == 1 && j == 1

    if c[i-1][j-1] == '#'
      dp[i][j] = 0
    else
      dp[i][j] = dp[i-1][j] + dp[i][j-1]
    end
  end
end

p dp[h][w]
