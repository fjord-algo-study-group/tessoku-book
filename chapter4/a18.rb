n,s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

dp = Array.new(n+1){Array.new(10010)}

dp[0][0] = true

(1..n).each do |i|
  #真下にいく
  (10010).times do |j|
    dp[i][j] = true if dp[i-1][j]
    #斜めに行く
    unless j-a[i-1] < 0
      dp[i][j] = true if dp[i-1][j-a[i-1]]
    end
  end
end

puts dp[n][s] ? 'Yes' : 'No'