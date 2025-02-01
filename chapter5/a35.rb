n = gets.to_i
arr = gets.split.map(&:to_i)
dp = Array.new(n-1) { Array.new(n, 0)}
dp << arr
(n-1).downto(0) do |i|
  i.times do |j|
    dp[i-1][j] = [dp[i][j], dp[i][j+1]].send((i.even? ? :min : :max))
  end
end
# (n-1).times do |i|
#   current = n-1-i
#   current.times do |j|
#     dp[current-1][j] = [dp[current][j], dp[current][j+1]].send((current.even? ? :min : :max))
#   end
# end
puts dp[0][0]
